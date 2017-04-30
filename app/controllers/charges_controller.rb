class ChargesController < ApplicationController

  before_action :ordersPermissions
  def index
    @categories = Category.all

    if params[:category_selection].present?
        @category_selection = params[:category_selection]
        @plates = Plate.where(category_id: @category_selection).paginate(page: params[:page], per_page: 8)

    else
        @plates = Plate.all.paginate(page: params[:page], per_page: 8)
    end

    @order = Order.find(params[:order])

    render "index"
  end

  #def filterDishes
  #  render :index
  #end

  def questionnaire
      @category_selection = params[:category_selection]
      @plate = Plate.find(params[:plate])
      @order = Order.find(params[:order])
  end

  def addCharge
    @category_selection = params[:category_selection]
    @categories = Category.all
    @order = Order.find(params[:order])
    @special = (params[:special].present?)? true : false;
    @order.charges.create(order_id: @order.id, plate_id:params[:plate],special:@special,observations:params[:observations])
    @order.updateAmount
    @plates = (@category_selection.nil?) ? Plate.all.paginate(page: params[:page], per_page: 8): @plates = Plate.where(category_id: @category_selection).order('name asc').paginate(page: params[:page], per_page: 8)
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
