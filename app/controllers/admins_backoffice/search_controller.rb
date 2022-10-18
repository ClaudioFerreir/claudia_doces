class AdminsBackoffice::SearchController < AdminsBackofficeController
  def sweets
    @sweets = Sweet.where("lower(name) LIKE ?", "%#{params[:term].downcase}%")
                   .order(:name)
									 .page(params[:page])
  end
end
