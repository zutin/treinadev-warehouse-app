class WarehousesController < ApplicationController
  def show
    id = params[:id]
    @warehouse = Warehouse.find(id)
  end

  def new
  end

  def create
    w_params = params.require(:warehouse).permit(:name, :code, :area, :city, :address, :zipcode, :description)

    w = Warehouse.new(w_params)
    w.save()

    flash[:notice] = "Warehouse registered successfully."
    redirect_to root_path
  end
end