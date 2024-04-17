class ProductModelsController < ApplicationController
  def index
    @product_models = ProductModel.all
  end

  def new
    @product_model = ProductModel.new
    @suppliers = Supplier.all
  end

  def create
    product_model_params = params.require(:product_model).permit(:name, :width, :height, :depth, :weight, :sku, :supplier_id)
    
    @product_model = ProductModel.new(product_model_params)
    if @product_model.save()
      redirect_to @product_model, notice: 'Product model created successfully.'
    else
      flash.now[:notice] = 'Error while creating a product model.'

      @suppliers = Supplier.all
      render 'new'
    end
  end

  def show
    @product_model = ProductModel.find(params[:id])
  end
end