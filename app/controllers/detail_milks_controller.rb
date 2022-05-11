class DetailMilksController < ApplicationController
  before_action :set_detail_milk, only: [:show, :edit, :update, :destroy]

  # GET /detail_milks
  # GET /detail_milks.json
  def index
    session[:account_id] = params[:id] if params[:id].present?
    @account_id = session[:account_id]
    @date = Date.parse(params[:date]) rescue Date.current
    @detail_milks = Account.find_by(id: @account_id)&.detail_milks&.where(:created_at => @date.beginning_of_day..@date.end_of_day)
    @today_sale =  @detail_milks&.pluck(:total)&.reject(&:blank?)&.sum
    @advances = Account.find_by(id: @account_id)&.advances&.where(:created_at => @date&.beginning_of_day..@date&.end_of_day, meat: false)
    @advance =  @advances&.pluck(:amount)&.reject(&:blank?)&.sum
    @total_orders   = @detail_milks&.size
    @milk_total = @detail_milks&.pluck(:milk).sum - @detail_milks&.pluck(:weight).sum
    @current_orders = @detail_milks&.count
  end

  # GET /detail_milks/1
  # GET /detail_milks/1.json
  def show
  end

  # GET /detail_milks/new
  def new
    @account_id = params[:id]
    @detail_milk = DetailMilk.new
  end

  # GET /detail_milks/1/edit
  def edit
  end

  # POST /detail_milks
  # POST /detail_milks.json
  def create
    @detail_milk = DetailMilk.new(detail_milk_params)
    @account_id = params[:account_id] if params[:account_id].present?
    respond_to do |format|
      if @detail_milk.save
        price = (@detail_milk.milk - @detail_milk.weight) * @detail_milk.rate
        @detail_milk.update(total: price.to_i)
        total_amount = @detail_milk.account.credit + price.to_i
        @detail_milk.account.update(credit: total_amount)
        @detail_milk.account.update(advance: @detail_milk.account.advance - price)
        format.html { redirect_to detail_milks_path, notice: 'Detail milk was successfully created.' }
        format.json { render :show, status: :created, location: @detail_milk }
      else
        format.html { render :new }
        format.json { render json: @detail_milk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detail_milks/1
  # PATCH/PUT /detail_milks/1.json
  def update
    respond_to do |format|
      amount =@detail_milk.account.credit - @detail_milk.total
      @detail_milk.account.update(credit: amount)
      if @detail_milk.update(detail_milk_params)
      updated_amount =@detail_milk.account.credit + @detail_milk.total
      @detail_milk.account.update(credit: amount)
        format.html { redirect_to accounts_path, notice: 'Detail milk was successfully updated.' }
        format.json { render :show, status: :ok, location: @detail_milk }
      else
        format.html { render :edit }
        format.json { render json: @detail_milk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detail_milks/1
  # DELETE /detail_milks/1.json
  def destroy
    @account_id = params[:account_id] if params[:account_id].present?
    @detail_milk.destroy
    amount = @detail_milk.account.credit - @detail_milk.total
    @detail_milk.account.update(credit: amount)
    @detail_milk.account.update(advance: @detail_milk.account.advance + @detail_milk.total)
    respond_to do |format|
      format.html { redirect_to detail_milks_path, notice: 'Detail milk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detail_milk
      @detail_milk = DetailMilk.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def detail_milk_params
      params.require(:detail_milk).permit(:milk, :weight, :account_id, :rate, :user_id, :created_at)
    end
end
