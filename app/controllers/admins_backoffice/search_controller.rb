class AdminsBackoffice::SearchController < AdminsBackofficeController
  def sweets
    @sweets = Sweet.search(params[:term], params[:page])
  end
end
