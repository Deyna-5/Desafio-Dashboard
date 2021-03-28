class SalesCoffeesController < ApplicationController
  before_action :set_sales_coffee, only: %i[ show edit update destroy ]

  # GET /sales_coffees or /sales_coffees.json
  def index
    #LOS ULTIMOS 12 MESES
    @sales_group_by_month = SalesCoffee.twelve_months_ago.group_by_month(:date_time).order(date_time: :asc ).sum(:price)
    @sales_quantity_twelve_months = SalesCoffee.twelve_months_ago.group_by_month(:date_time).order(date_time: :asc).count
    @sales_average_twelve_months = SalesCoffee.twelve_months_ago.group_by_month(:date_time).order(date_time: :asc).average(:price)

    #SEGUN ORIGEN
    @origen_twelve_months = SalesCoffee.twelve_months_ago
    @origen_six_months = SalesCoffee.six_months_ago
    @origen_three_months = SalesCoffee.three_months_ago
    @origen_last_month = SalesCoffee.last_month_ago

    #SEGUN MEZCLA
    @blend_name_twelve_months = SalesCoffee.twelve_months_ago
    @blend_name_six_months = SalesCoffee.six_months_ago
    @blend_name_three_months = SalesCoffee.three_months_ago
    @blend_name_last_month = SalesCoffee.last_month_ago
  end

  # GET /sales_coffees/1 or /sales_coffees/1.json
  def show
  end

  # GET /sales_coffees/new
  def new
    @sales_coffee = SalesCoffee.new
  end

  # GET /sales_coffees/1/edit
  def edit
  end

  # POST /sales_coffees or /sales_coffees.json
  def create
    @sales_coffee = SalesCoffee.new(sales_coffee_params)

    respond_to do |format|
      if @sales_coffee.save
        format.html { redirect_to @sales_coffee, notice: "Sales coffee was successfully created." }
        format.json { render :show, status: :created, location: @sales_coffee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sales_coffee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales_coffees/1 or /sales_coffees/1.json
  def update
    respond_to do |format|
      if @sales_coffee.update(sales_coffee_params)
        format.html { redirect_to @sales_coffee, notice: "Sales coffee was successfully updated." }
        format.json { render :show, status: :ok, location: @sales_coffee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sales_coffee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_coffees/1 or /sales_coffees/1.json
  def destroy
    @sales_coffee.destroy
    respond_to do |format|
      format.html { redirect_to sales_coffees_url, notice: "Sales coffee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_coffee
      @sales_coffee = SalesCoffee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sales_coffee_params
      params.require(:sales_coffee).permit(:origin, :price, :blend_name)
    end
end
