class SuppliersController < ApplicationController

  before_action :set_supplier, only: [:show, :edit, :update]

  def index
    @suppliers = Supplier.all
  end

  def show; end

  def new
    @supplier = Supplier.new
  end

  def create
    sup_params = params.require(:supplier).permit(:corporate_name, :brand_name, :registration_number, :full_address, :city, :state, :email)

    @supplier = Supplier.new(sup_params)
    
    if @supplier.save()
      redirect_to(suppliers_path, notice: 'Supplier created successfully.')
    else
      flash.now[:notice] = "Error while creating a supplier."
      render 'new'
    end
  end

  def edit; end

  def update
    sup_params = params.require(:supplier).permit(:corporate_name, :brand_name, :registration_number, :full_address, :city, :state, :email)

    if @supplier.update(sup_params)
      redirect_to(suppliers_path, notice: 'Supplier edited successfully.')
    else
      flash.now[:notice] = "Error while editing a supplier"
      render 'edit'
    end
  end

  private

  def set_supplier
    @supplier = Supplier.find(params[:id])
  end
end