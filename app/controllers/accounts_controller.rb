class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy, :report, :result]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = current_user.hotels.first.accounts
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to accounts_path, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to accounts_path, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def report
    if params[:daterange].present?
      @from = (Date.strptime(params[:daterange].split("-").first.strip,'%m/%d/%y') + 1.year)
      @till = (Date.strptime(params[:daterange].split("-").last.strip,'%m/%d/%y') + 1.year)
      @detail_milks = DetailMilk.where('account_id = ? AND created_at BETWEEN ? AND ?',@account.id, @from.beginning_of_day, @till.end_of_day) if params[:daterange].present?
      @advances = @account.advances.where("created_at >= ? AND created_at <= ?", @from, @till) if params[:daterange].present?
      @deposits = @account.deposits.where("created_at >= ? AND created_at <= ?", @from, @till)
    end
    @today_sale =  @detail_milks&.pluck(:total)&.reject(&:blank?)&.sum rescue 0
    @advance =  @advances&.pluck(:amount)&.reject(&:blank?)&.sum
    @deposit =  @deposits&.pluck(:amount)&.map{|e| e.to_i }&.reject(&:blank?)&.sum
  end

  def result
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:name, :phone, :credit, :advance, :hotel_id, :user_type, :rate)
    end
end
