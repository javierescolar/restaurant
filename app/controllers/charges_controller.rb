class ChargesController < ApplicationController

  before_action :ordersPermissions
  def index
    @categories = Category.all
    if params[:category_selection].present?
        @plates = Plate.where(category_id: params[:category_selection]).order('name asc')
    else
        @plates = Plate.all.order('name asc')
    end

    @order = Order.find(params[:order])

    render "index"
  end

  def filterDishes
    render :index
  end

  def addCharge
    @categories = Category.all
    @order = Order.find(params[:order])
    @order.charges.create(order_id: @order.id, plate_id:params[:plate])
    @order.updateAmount
    @plates = Plate.all
    flash[:notice] = "Plate save into order"
    render "index"
  end

  def removeCharge

    @order = Order.find(params[:order])
    @order.charges.find(params[:charge]).delete
    @order.updateAmount
    @plates = Plate.all

    flash[:notice] = "Plate destroy from order"
    redirect_to @order
  end

  def preparedDish
    @dish_order = Charge.find(params[:dish])
    @dish_order.preparedDishYesNo
    redirect_to orders_path
  end

end
