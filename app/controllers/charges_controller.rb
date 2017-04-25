class ChargesController < ApplicationController

  before_action :ordersPermissions
  def index
    @plates = Plate.all
    @order = Order.find(params[:order])
    render "index"
  end

  def addCharge
    @order = Order.find(params[:order])
    @plates = Plate.all
    @order.charges.create(order_id: @order.id, plate_id:params[:plate])
    #@order.addPlate(params[:plate])
    flash[:notice] = "Plate save into order"
    render "index"
  end

  def removeCharge
    @order = Order.find(params[:order])
    @order.charges.find(params[:charge]).delete
    #@order = Order.find(params[:order])
    @plates = Plate.all
    #@order.removePlate(params[:plate])
    flash[:notice] = "Plate destroy from order"
    redirect_to @order
  end

  def preparedDish
    @dish_order = Charge.find(params[:dish])
    @dish_order.preparedDishYesNo
    redirect_to orders_path
  end

end
