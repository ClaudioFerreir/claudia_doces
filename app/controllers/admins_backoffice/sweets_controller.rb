class AdminsBackoffice::SweetsController < AdminsBackofficeController
	before_action :set_sweet, only: [:edit, :update, :destroy]

  def index
  	@sweets = Sweet.all.order(:name).page(params[:page])
  end

	def new
		@sweet = Sweet.new
	end

	def create
		@sweet = Sweet.new(params_sweet)
		if @sweet.save
			redirect_to admins_backoffice_sweets_path, notice: 'Produto cadastrado com sucesso'
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @sweet.update(params_sweet)
			redirect_to admins_backoffice_sweets_path, notice: 'Produto atualizado com sucesso'
		else
			render :edit
		end
	end

	def destroy
		if @sweet.destroy
			redirect_to admins_backoffice_sweets_path, notice: 'Produto excluido com sucesso'
		else
			render :index
		end
	end

	private

	def params_sweet
		params.require(:sweet).permit(:name, :description, :subject_id, :price, :image)
	end

	def set_sweet
		@sweet = Sweet.find(params[:id])
	end
end


