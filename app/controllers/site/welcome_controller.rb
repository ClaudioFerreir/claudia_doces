class Site::WelcomeController < SiteController
  def index
    @sweets = Sweet.all
    @subjects = Subject.all
  end
end
