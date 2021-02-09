class OneMenusController < ApplicationController
  before_action :set_one_menu, only: [:show, :edit, :update, :destroy]

  # GET /one_menus
  # GET /one_menus.json
  def index
    @one_menus = OneMenu.all
    @order = Order.new
  end

  # GET /one_menus/1
  # GET /one_menus/1.json
  def show
  end

  # GET /one_menus/new
  def new
    @one_menu = OneMenu.new
  end

  # GET /one_menus/1/edit
  def edit
  end

  # POST /one_menus
  # POST /one_menus.json
  def create
    @one_menu = OneMenu.new(one_menu_params)

    respond_to do |format|
      if @one_menu.save
        @one_menu.update(position: @one_menu.id)
        format.html { redirect_to root_path, notice: 'One menu was successfully created.' }
        format.json { render :show, status: :created, location: @one_menu }
      else
        format.html { render :new }
        format.json { render json: @one_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /one_menus/1
  # PATCH/PUT /one_menus/1.json
  def update
    respond_to do |format|
      if @one_menu.update(one_menu_params)
        format.html { redirect_to menu_sorting_orders_path, notice: 'One menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @one_menu }
      else
        format.html { render :edit }
        format.json { render json: @one_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /one_menus/1
  # DELETE /one_menus/1.json
  def destroy
    @one_menu.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'One menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_one_menu
      @one_menu = OneMenu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def one_menu_params
      params.require(:one_menu).permit(:name, :hotel_id)
    end
end
