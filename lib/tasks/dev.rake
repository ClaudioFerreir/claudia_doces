namespace :dev do

  DEFAULT_PASSWORD = 123456
  DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')

  desc "Configure the development environment"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando o banco de dados...") { %x(rails db:drop) }
      show_spinner("Criando o banco de dados...") { %x(rails db:create) }
      show_spinner("Migrando o banco de dados...") { %x(rails db:migrate) }
      show_spinner("Cadastrando o adminstrador padrão...") { %x(rails dev:add_default_admin) }
      show_spinner("Cadastrando adminstradores extras...") { %x(rails dev:add_extra_admins) }
      show_spinner("Cadastrando o usuário padrão...") { %x(rails dev:add_default_user) }
      show_spinner("Cadastrando categorias padrão...") { %x(rails dev:add_default_subjects) }
      show_spinner("Cadastrando doces...") { %x(rails dev:add_sweets) }
      
    else
      puts "Você não está no ambiente de desenvolvimento!"
    end
  end

  desc "Adiciona o administrador padrão"
  task add_default_admin: :environment do
    Admin.create!(
      email: 'admin@admin.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
      )
  end

  desc "Adiciona o administradores extras"
  task add_extra_admins: :environment do
    5.times do |i|
      Admin.create!(
        email: Faker::Internet.email,
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
        )
    end
  end
  
  desc "Adiciona o usuário padrão"
  task add_default_user: :environment do
    User.create!(
      email: 'user@user.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
      )
  end

  desc "Adiciona categorias padrão"
  task add_default_subjects: :environment do
    file_name = 'subjects.txt'
    file_path = File.join(DEFAULT_FILES_PATH, file_name)

    File.open(file_path, 'r').each do |line|
      Subject.create!(description: line.strip)
    end  
  end

  private

    def show_spinner(msg_start, msg_end = "Concluído!")
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield
      spinner.success{"(#{msg_end})"}
    end
end