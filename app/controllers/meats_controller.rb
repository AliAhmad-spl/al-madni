class MeatsController < ApplicationController
  before_action :set_meat, only: [:show, :edit, :update, :destroy]

  # GET /meats
  # GET /meats.json
  def index
    session[:account_id] = params[:id] if params[:id].present?
    @account_id = session[:account_id]
    @date = Date.parse(params[:date]) rescue Date.current
    @meats = Account.find_by(id: @account_id)&.meats&.where(:created_at => @date.beginning_of_day..@date.end_of_day)
    @today_sale = @meats&.pluck(:total)&.reject(&:blank?)&.sum
    @advances = Account.find_by(id: @account_id)&.advances&.where(:created_at => @date&.beginning_of_day..@date&.end_of_day, meat: true)
    @advance =  @advances&.pluck(:amount)&.reject(&:blank?)&.sum
    @total_orders = @meats&.size
    @meat_total = @meats&.pluck(:qty)&.reject(&:blank?)&.sum.round(2)
    @current_orders = @meat&.count
  end

  # GET /meats/1
  # GET /meats/1.json
  def show
  end

  # GET /meats/new
  def new
    @account_id = params[:id]
    @meat = Meat.new
  end

  # GET /meats/1/edit
  def edit
  end

  # POST /meats
  # POST /meats.json
  def create
    @meat = Meat.new(meat_params)

    respond_to do |format|
      if @meat.save
        total = @meat.qty * @meat.price
        @meat.update(total: total)
        format.html { redirect_to meats_path, notice: 'Meat was successfully created.' }
        format.json { render :show, status: :created, location: @meat }
      else
        format.html { render :new }
        format.json { render json: @meat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meats/1
  # PATCH/PUT /meats/1.json
  def update
    respond_to do |format|
      if @meat.update(meat_params)
        format.html { redirect_to @meat, notice: 'Meat was successfully updated.' }
        format.json { render :show, status: :ok, location: @meat }
      else
        format.html { render :edit }
        format.json { render json: @meat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meats/1
  # DELETE /meats/1.json
  def destroy
    @meat.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Meat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meat
      @meat = Meat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meat_params
      params.require(:meat).permit(:qty, :price, :cat_type, :account_id)
    end
end
