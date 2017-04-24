class OrdersPlatesController < ApplicationController
  before_action :ordersPermissions
  def index
    @plates = Plate.all
    @order = Order.find(params[:order])
    render "index"
  end

  def addPlateOrder
    @order = Order.find(params[:order])
    @plates = Plate.all
    @order.addPlate(params[:plate])
    flash[:notice] = "Plate save into order"
    render "index"
  end

  def removePlateOrder
    @order = Order.find(params[:order])
    @plates = Plate.all
    @order.removePlate(params[:plate])
    flash[:notice] = "Plate destroy from order"
    redirect_to @order
  end

  
end
