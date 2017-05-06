class ChargesController < ApplicationController
  before_action :chargesPermissions, except: [:index,:questionnaire,:addCharge,:removeCharge]
  before_action :ordersPermissions , only: [:questionnaire,:addCharge,:removeCharge]
  before_action :set_filter_kitchen, only: [:preparedDish,:filterOrdersKitchen,:preparedDish]

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
    #anadimos las lineas del encargo
    questionnaire = params[:answers]
    @category_selection = params[:category_selection]
    @categories = Category.all
    @order = Order.find(params[:order])
    @special = (params[:special].present?)? true : false;
    chargeInsert = @order.charges.create(order_id: @order.id, plate_id:params[:plate],special:@special,observations:params[:observations])
    @order.updateAmount
    questionnaire.each do |product,question|
      question.each do |ques,answer|
        chargeInsert.charges_lines.create(charge_id:chargeInsert.id,product_id:product,question_id:ques,answer_id:answer['answer'])
      end
    end
    @plates = (@category_selection.nil?) ? Plate.all.paginate(page: params[:page], per_page: 8): @plates = Plate.where(category_id: @category_selection).order('name asc').paginate(page: params[:page], per_page: 8)
    flash[:notice] = "Plate save into order"
    render "index"
  end

  def removeCharge
    @order = Order.find(params[:order])
    charge = @order.charges.find(params[:charge])
    charge.charges_lines.destroy_all
    charge.delete
    @order.updateAmount
    @plates = Plate.all
    flash[:notice] = "Plate destroy from order"
    redirect_to @order
  end

  def preparedDish
    @dish_order = Charge.find(params[:dish])
    @dish_order.preparedDishYesNo
    if !@status_selection.nil?
      @dishes = Charge.joins("INNER JOIN orders o ON charges.order_id = o.id and o.kitchen = 1 and o.paid=0").where(prepared:@status_selection)
    else
      @dishes = Charge.joins("INNER JOIN orders o ON charges.order_id = o.id and o.kitchen = 1 and o.paid=0")
    end
    render :kitchen
  end

  def kitchen
    if !@status_selection.nil?
      @dishes = Charge.joins("INNER JOIN orders o ON charges.order_id = o.id and o.kitchen = 1 and o.paid=0").where(prepared:@status_selection)
    else
      @dishes = Charge.joins("INNER JOIN orders o ON charges.order_id = o.id and o.kitchen = 1 and o.paid=0")
    end
  end

  def filterOrdersKitchen
    @dishes = Charge.joins("INNER JOIN orders o ON charges.order_id = o.id and o.kitchen = 1 and o.paid=0").where(prepared:@status_selection)
    render :kitchen
  end

  private
    def set_filter_kitchen
        @status_selection = params[:status_selection]
    end

end
