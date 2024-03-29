class AdvancesController < ApplicationController
  before_action :set_advance, only: [:show, :edit, :update, :destroy]

  # GET /advances
  # GET /advances.json
  def index
    @account_id = params[:id]
    @advances = current_user.hotels.first.accounts.where(id: params[:id]).first.advances
  end

  # GET /advances/1
  # GET /advances/1.json
  def show
  end

  # GET /advances/new
  def new
    @account_id = params[:id]
    @meat = params[:meat]
    @advance = Advance.new
  end

  # GET /advances/1/edit
  def edit
  end

  # POST /advances
  # POST /advances.json
  def create
    @advance = Advance.new(advance_params)
    @account_id = params[:account_id] if params[:account_id].present?
    respond_to do |format|
      if @advance.save
        amount = @advance.account.advance + @advance.amount
        @advance.account.update(advance: amount)
        @advance.account.update(credit: @advance.account.credit - @advance.amount)
        if params[:advance][:meat].present?
          @advance.update(meat: true)
          format.html { redirect_to meats_path(id: @advance.account.id), notice: 'Advance was successfully created.' }
        else
          format.html { redirect_to detail_milks_path, notice: 'Advance was successfully created.' }
        end
        format.json { render :show, status: :created, location: @advance }
      else
        format.html { render :new }
        format.json { render json: @advance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /advances/1
  # PATCH/PUT /advances/1.json
  def update
    respond_to do |format|
      amount = @advance.account.advance - @advance.amount
      @advance.account.update(advance: amount)
      if @advance.update(advance_params)
        amount = @advance.account.advance + advance.amount
        @advance.account.update(advance: amount)
        format.html { redirect_to accounts_path, notice: 'Advance was successfully updated.' }
        format.json { render :show, status: :ok, location: @advance }
      else
        format.html { render :edit }
        format.json { render json: @advance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advances/1
  # DELETE /advances/1.json
  def destroy
    amount = @advance.account.advance - @advance.amount
    @advance.account.update(advance: amount)
    @advance.account.update(credit: @advance.account.credit + @advance.amount)
    @advance.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Advance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advance
      @advance = Advance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def advance_params
      params.require(:advance).permit(:amount, :account_id, :created_at)
    end
end
