class WarehousesController < ApplicationController
  before_action :set_warehouse, only: [:show, :edit, :update, :destroy]

  def show; end

  def new
    @warehouse = Warehouse.new
  end

  def create
    w_params = params.require(:warehouse).permit(:name, :code, :area, :city, :address, :zipcode, :description)

    @warehouse = Warehouse.new(w_params)
    
    if @warehouse.save()
      redirect_to root_path, notice: "Warehouse registered successfully."
    else
      flash.now[:notice] = "You must provide all warehouse data."
      render 'new'
    end
  end

  def edit; end

  def update
    w_params = params.require(:warehouse).permit(:name, :code, :area, :city, :address, :zipcode, :description)
    
    if @warehouse.update(w_params)
      redirect_to warehouse_path(@warehouse.id), notice: "Warehouse edited successfully."
    else
      flash.now[:notice] = "It was not possible to edit this warehouse."
      render 'edit'
    end
  end

  def destroy
    if @warehouse.destroy()
      redirect_to root_path, notice: "Warehouse deleted successfully."
    else
      flash.now[:notice] = "It was not possible to delete this warehouse."
      render 'show'
    end
  end

  private

  def set_warehouse
    @warehouse = Warehouse.find(params[:id])
  end
end