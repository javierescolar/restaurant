class DishesProductsController < ApplicationController
before_action :set_plate_id
  # GET /dishes_products
  # GET /dishes_products.json

  def index
    @plate = Plate.find(@plate_id)
    @dishes_products = DishesProduct.where(plate_id:@plate_id)
  end

  def new
      @products = Product.all
      @dishes_product = DishesProduct.new(plate_id:@plate_id)
  end

  def edit
    @products = Product.all
    @dishes_product = DishesProduct.find(params[:registro])
  end

  def update
    @dish_product = DishesProduct.find(params[:registro])
    @dish_product.update(product_id:(params[:product_id]),quantity:(params[:prodquantityuct_id]),unit_measure:(params[:unit_measure]))

    @dishes_products = DishesProduct.where(plate_id:@plate_id)
    flash[:notice] = "Product was successfully updated"
    redirect_to '/plates/'+@plate_id.to_s+'/products'
  end

  def create
    DishesProduct.new(plate_id:@plate_id, product_id:params[:product_id],quantity:(params[:quantity]),unit_measure:(params[:unit_measure])).save
    @dishes_products = DishesProduct.where(plate_id:@plate_id)
    flash[:notice] = "Product was successfully created"
    redirect_to '/plates/'+@plate_id.to_s+'/products'
  end

  def destroy
      DishesProduct.find(params[:registro]).delete
      @dishes_products = DishesProduct.where(plate_id:@plate_id)
      flash[:notice] = "Product was successfully destoyed"
      redirect_to '/plates/'+@plate_id.to_s+'/products'
  end

  private
  def set_plate_id
    @plate_id = params[:id]
  end

  def product_params
    params.require(:dishes_product).permit(:product_id,:quantity,:unit_measure)
  end
end
