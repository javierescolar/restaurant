class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy,:receivable, :sendKitchen]
  before_action :ordersPermissions, except: [:history]
  before_action :ordersHistoryPermissions, only: [:history]
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.where(paid:false)
    if (Table.where(free:true).count == 0)
        flash[:notice_tables] = "No tables available"
    end
  end

  def history
    @orders = Order.where(paid:true).order('created_at asc')
  end
  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @tables = Table.where(free:true)
    @users = User.all
  end

  # GET /orders/1/edit
  def edit
    @tables = Table.where(free:true)
    @users = User.all
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        @order.table.changeStatusTable(false)
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        @tables = Table.where(free:true)
        @users = User.all
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    @order.table.changeStatusTable(true)
    respond_to do |format|
      if @order.update(order_params)
        @order.table.changeStatusTable(false)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        @tables = Table.where(free:true)
        @users = User.all
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.table.changeStatusTable(true)
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def receivable
    @order.closeOrder
    flash[:notice] = "the order has been paid"
    redirect_to orders_path
  end

  def sendKitchen
    @order.sendKitchen
    flash[:notice] = "the order has been sent"
    redirect_to orders_path
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_id, :table_id, :amount, :paid, :date)
    end
end
