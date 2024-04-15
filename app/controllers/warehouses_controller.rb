class WarehousesController < ApplicationController
  def show
    id = params[:id]
    @warehouse = Warehouse.find(id)
  end

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
end