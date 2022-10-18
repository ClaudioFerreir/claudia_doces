class AdminsBackoffice::SearchController < AdminsBackofficeController
  def sweets
    @sweets = Sweet.includes(:subject)
		               .order(:name)
									 .page(params[:page])
  end
end
