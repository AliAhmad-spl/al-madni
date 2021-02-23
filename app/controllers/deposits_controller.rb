class DepositsController < ApplicationController
  before_action :set_deposit, only: [:show, :edit, :update, :destroy]

  # GET /deposits
  # GET /deposits.json
  def index
    @account_id = params[:id]
    @deposits = Account.find_by(id: params[:id]).deposits
  end

  # GET /deposits/1
  # GET /deposits/1.json
  def show
  end

  # GET /deposits/new
  def new
    @account_id = params[:id]
    @deposit = Deposit.new
  end

  # GET /deposits/1/edit
  def edit
  end

  # POST /deposits
  # POST /deposits.json
  def create
    @deposit = Deposit.new(different_params)

    respond_to do |format|
      if @deposit.save
        @deposit.account.update(deposit: @deposit.account.deposit + @deposit.amount.to_i)
        format.html { redirect_to accounts_path, notice: 'Deposit was successfully created.' }
        format.json { render :show, status: :created, location: @deposit }
      else
        format.html { render :new }
        format.json { render json: @deposit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deposits/1
  # PATCH/PUT /deposits/1.json
  def update
    respond_to do |format|
      if @deposit.update(deposit_params)
        @deposit.account.update(deposit: @deposit.account.deposit - @deposit.amount.to_i)
        format.html { redirect_to accounts_path, notice: 'Deposit was successfully updated.' }
        format.json { render :show, status: :ok, location: @deposit }
      else
        format.html { render :edit }
        format.json { render json: @deposit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deposits/1
  # DELETE /deposits/1.json
  def destroy
    @deposit.destroy
    @deposit.account.update(deposit: @deposit.account.deposit - @deposit.amount.to_i)
    respond_to do |format|
      format.html { redirect_to accounts_path, notice: 'Deposit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deposit
      @deposit = Deposit.find(params[:id])
    end

    def different_params
      params.require(:deposit).permit(:amount, :account_id, :status)
    end

    # Only allow a list of trusted parameters through.
    def deposit_params
      params.permit(:amount, :account_id, :status)
    end
end
