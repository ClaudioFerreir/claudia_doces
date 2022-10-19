class Site::WelcomeController < SiteController
  def index
    @sweets = Sweet.last_sweets
    @subjects = Subject.all
  end
end
