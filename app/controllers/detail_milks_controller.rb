class DetailMilksController < ApplicationController
  before_action :set_detail_milk, only: [:show, :edit, :update, :destroy]

  # GET /detail_milks
  # GET /detail_milks.json
  def index
    @date = Date.parse(params[:date]) rescue Date.today
    @detail_milks = Account.find_by(id: params[:id])&.detail_milks&.where(:created_at => @date.at_midnight..@date.next_day.at_midnight)
    @today_sale =  @detail_milks&.pluck(:total)&.reject(&:blank?)&.sum
    @total_orders   = @detail_milks&.size
    @current_orders = @detail_milks&.count
  end

  # GET /detail_milks/1
  # GET /detail_milks/1.json
  def show
  end

  # GET /detail_milks/new
  def new
    @detail_milk = DetailMilk.new
  end

  # GET /detail_milks/1/edit
  def edit
  end

  # POST /detail_milks
  # POST /detail_milks.json
  def create
    @detail_milk = DetailMilk.new(detail_milk_params)

    respond_to do |format|
      if @detail_milk.save
        price = (@detail_milk.milk - @detail_milk.weight) * @detail_milk.rate
        @detail_milk.update(total: price.to_i)
        total_amount = @detail_milk.account.credit + price.to_i
        @detail_milk.account.update(credit: total_amount)
        format.html { redirect_to accounts_path, notice: 'Detail milk was successfully created.' }
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
    @detail_milk.destroy
    amount = @detail_milk.account.credit - @detail_milk.total
    @detail_milk.account.update(credit: amount)
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Detail milk was successfully destroyed.' }
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
      params.require(:detail_milk).permit(:milk, :weight, :account_id, :rate)
    end
end
