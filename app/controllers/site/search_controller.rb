class Site::SearchController < SiteController
  def sweets
    @sweets = Sweet.all
  end
end
