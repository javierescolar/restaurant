class DishesProductsController < ApplicationController
  before_action :set_dishes_product, only: [:show, :edit, :update, :destroy]

  # GET /dishes_products
  # GET /dishes_products.json
  def index
    @dishes_products = DishesProduct.all
  end

  # GET /dishes_products/1
  # GET /dishes_products/1.json
  def show
  end

  # GET /dishes_products/new
  def new
    @dishes_product = DishesProduct.new
  end

  # GET /dishes_products/1/edit
  def edit
  end

  # POST /dishes_products
  # POST /dishes_products.json
  def create
    @dishes_product = DishesProduct.new(dishes_product_params)

    respond_to do |format|
      if @dishes_product.save
        format.html { redirect_to @dishes_product, notice: 'Dishes product was successfully created.' }
        format.json { render :show, status: :created, location: @dishes_product }
      else
        format.html { render :new }
        format.json { render json: @dishes_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dishes_products/1
  # PATCH/PUT /dishes_products/1.json
  def update
    respond_to do |format|
      if @dishes_product.update(dishes_product_params)
        format.html { redirect_to @dishes_product, notice: 'Dishes product was successfully updated.' }
        format.json { render :show, status: :ok, location: @dishes_product }
      else
        format.html { render :edit }
        format.json { render json: @dishes_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dishes_products/1
  # DELETE /dishes_products/1.json
  def destroy
    @dishes_product.destroy
    respond_to do |format|
      format.html { redirect_to dishes_products_url, notice: 'Dishes product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dishes_product
      @dishes_product = DishesProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dishes_product_params
      params.require(:dishes_product).permit(:plate_id, :product_id)
    end
end
