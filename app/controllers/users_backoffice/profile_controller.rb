class UsersBackoffice::ProfileController < UsersBackofficeController
  before_action :verify_password, only: [:update]
  before_action :set_user, only: [:edit, :update]
  
  def edit
    #construir um perfil para o usuário neste caso de has_one
    @user.build_user_profile if @user_profile.blank?
  end

  def update
    if @user.update(params_user)
      bypass_sign_in(@user) # bypass: true -> não pede senha na hora de atualizar
      redirect_to users_backoffice_profile_path, notice: "Usuário atualizado com sucesso"
    else
      render :edit
    end
  end  

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def params_user
    params.require(:user).permit(:first_name,:last_name, :email, :password, :password_confirmation,
    user_profile_attributes: [:address, :gender, :birthdate])
  end

  def verify_password
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].extract!(:password, :password_confirmation)
    end
  end
end
