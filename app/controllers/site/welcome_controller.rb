class Site::WelcomeController < SiteController
  def index
    console
    @sweets = Sweet.all
    @subjects = Subject.all
  end
end
