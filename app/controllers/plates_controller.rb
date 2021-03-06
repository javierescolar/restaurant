class PlatesController < ApplicationController
  before_action :set_plate, only: [:show, :edit, :update, :destroy]
  before_action :createDishesPermissions, only:[:edit, :update,:destroy]
  # GET /plates
  # GET /plates.json
  def index
    @plates = Plate.all.paginate(page: params[:page], per_page: 8)
    @categories = Category.all
  end

  def filterDishes
    @category_selection = params[:category_selection]
    @plates = Plate.all.paginate(page: params[:page], per_page: 8)
    if @category_selection .present?
        @plates = Plate.where(category_id: @category_selection).paginate(page: params[:page], per_page: 8)
    end
    @categories = Category.all
    render :index
  end



  # GET /plates/1
  # GET /plates/1.json
  def show
  end

  # GET /plates/new
  def new
    @plate = Plate.new
    @categories = Category.all
  end

  # GET /plates/1/edit
  def edit
    @categories = Category.all
  end

  # POST /plates
  # POST /plates.json
  def create
    @plate = Plate.new(plate_params)
    respond_to do |format|
      if  @plate.validateImage(params[:plate][:photo]) && @plate.save
        format.html { redirect_to @plate, notice: 'Plate was successfully created.' }
        format.json { render :show, status: :created, location: @plate }
      else
        @categories = Category.all
        format.html { render :new }
        format.json { render json: @plate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plates/1
  # PATCH/PUT /plates/1.json
  def update
    #@plate.removePhoto
    respond_to do |format|
      if @plate.validateImage(params[:plate][:photo]) && @plate.update(plate_params)
          format.html { redirect_to @plate, notice: 'Plate was successfully updated.' }
          format.json { render :show, status: :ok, location: @plate }
      else
        @categories = Category.all
        format.html { render :edit }
        format.json { render json: @plate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plates/1
  # DELETE /plates/1.json
  def destroy
    if @plate.checkDependences
      @plate.destroy
      respond_to do |format|
        format.html { redirect_to plates_url, notice: 'Plate was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        flash[:notice_bad] = 'You can´t delete it. This element has dependencies.'
        format.html { redirect_to plates_url }
        format.json { head :no_content }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plate
      @plate = Plate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plate_params
      params.require(:plate).permit(:category_id, :name, :description, :price, :photo)
    end
end
