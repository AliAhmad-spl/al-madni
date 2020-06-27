class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  # GET /orders
  # GET /orders.json
  def index
    @date             = Date.parse(params[:date]) rescue Date.today
    @orders           = Order.where(:created_at => @date.at_midnight..@date.next_day.at_midnight)
    @today_sale       = @orders.pluck(:total).reject(&:blank?).sum
    @total_orders   = Order.count
    @current_orders = @orders.size
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
     @one_menus = OneMenu.all
     @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  def all_users
   @users = User.paginate(page: params[:page])
  end
    

  # POST /orders
  # POST /orders.json
  def create
    quntities = []
    quntities = order_params[:quntities].reject(&:blank?)
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        if current_user.sale? || current_user.admin?
          @order.update(status: 'delivered')
        end
        @order.update(index: quntities)
        @prices=Product.where(id: @order.product_ids).pluck(:price)
        @quntities = @order.quntities.compact
        @zip = @prices.zip(@quntities)
        if @order.discount > 0
          discounted = @zip.map{|x, y| x*y}.sum - (@zip.map{|x, y| x*y}.sum * @order.discount/100)
          @order.update(total: discounted)
        else
          @order.update(total: @zip.map{|x, y| x*y}.sum)
        end

        format.html { redirect_to @order }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def status
   @orders = current_user.orders.paginate(page: params[:page])    
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(status: params[:status])
        format.html { redirect_to inbox_orders_path, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def inbox
    @orders = Order.where(customer: true).paginate(page: params[:page])
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def verify_admin
      if !current_user.admin?
        redirect_to  new_order_path, notice: "You are not allowed to check orders" 
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:customer_name, :user_id, :special_notes, :address, :contact_number, :discount, :customer, :quntities => [], :product_ids => [])
    end
end
