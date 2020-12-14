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

  def edited_orders
    @date             = Date.parse(params[:date]) rescue Date.today
    @orders           = Order.where(:created_at => @date.at_midnight..@date.next_day.at_midnight, edited: true)
    @today_sale       = @orders.pluck(:total).reject(&:blank?).sum
    @total_orders   = Order.count
    @current_orders = @orders.size
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @show_image = true
  end
  def update_menu
    menu = OneMenu.where(position: params[:position]).first
    if menu.present?
      new_menu = OneMenu.find(params[:id])
      menu.update(position: new_menu.position)
      new_menu.update(position: params[:position])
      redirect_to menu_sorting_orders_path, notice: 'Updated successfully!'
    else
      redirect_to menu_sorting_orders_path, alert: 'check current position & add proper value'
    end
  end

  def menu_sorting
    @menus = OneMenu.all
  end

  # GET /orders/new
  def new
    @show_image = true
     @one_menus = OneMenu.order(:position)
     @order = Order.new
  end

  # GET /orders/1/edit
  def edit
    @one_menus = OneMenu.order(:position)
    @order = Order.find(params[:id])
  end

  def all_users
   @users = User.paginate(page: params[:page])
  end
    

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.product_ids.any?
      if @order.save
         qty=params[:order][:quntities].first.permit!.to_h.first.last
        products.each do |p|                    
          OrderProduct.create!(product_id: p.id, name: p.name, price: p.price, quntity: qty[:"#{p.id}"].to_f, total: p.price * qty[:"#{p.id}"].to_f, order_id: @order.id)          
        end
        @other = @order.other_charges rescue 0
        if current_user.sale? || current_user.admin?
          @order.update(status: 'delivered')
        end

        if @order.discount > 0
          discounted = (OrderProduct.where(order_id: @order.id).pluck(:total).sum + @other) - ((OrderProduct.where(order_id: @order.id).pluck(:total).sum + @other) * @order.discount/100)
          @disc = (OrderProduct.where(order_id: @order.id).pluck(:total).sum + @other) * @order.discount/100
          @order.update(total: discounted, disc: @disc)
        else
          @order.update(total: (OrderProduct.where(order_id: @order.id).pluck(:total).sum + @other))
        end

        format.html { redirect_to @order }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    else
      format.html { redirect_to root_path, alert: "Please select at least 1 product!" }
    end
    end
  end

  def products
    @products ||= Product.includes(:one_menu).where(id: @order.product_ids)
  end

  def sold_products
    @date = Date.parse(params[:date]) rescue Date.today
    @orders = Order.where(:created_at => @date.at_midnight..@date.next_day.at_midnight)
    @products = OrderProduct.where(order_id: @orders.ids)
    @total_qty = @products.pluck(:quntity).sum rescue 0
    @amount = @products.pluck(:total).sum rescue 0
  end

  def status
   @orders = current_user.orders.paginate(page: params[:page])    
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
       new_est = params[:order][:product_ids]
       existing = @order.order_products.pluck(:product_id)
        if new_est.present?
       id =  existing.map { |e| e.to_s } -  new_est
       ops = OrderProduct.includes(:order).where(order_id: @order.id, product_id: id)
       ops.destroy_all
      @order.update(order_params)
      @order.update(edited: true)
      if @order.present?
         qty=params[:order][:quntities].first.permit!.to_h.first.last
        products.each do |p|                    
        op = OrderProduct.find_by(name: p.name, price: p.price, order_id: @order.id)          
          if op.present?
           op.update(quntity: qty[:"#{p.id}"].to_f, total: p.price * qty[:"#{p.id}"].to_f)
          else
            OrderProduct.create(name: p.name, price: p.price, quntity: qty[:"#{p.id}"].to_f, total: p.price * qty[:"#{p.id}"].to_f, order_id: @order.id)
          end
        end
        @other = @order.other_charges rescue 0
        if current_user.sale? || current_user.admin?
          @order.update(status: 'delivered')
        end

        if @order.discount > 0
          discounted = (OrderProduct.where(order_id: @order.id).pluck(:total).sum + @other) - ((OrderProduct.where(order_id: @order.id).pluck(:total).sum + @other) * @order.discount/100)
          @disc = (OrderProduct.where(order_id: @order.id).pluck(:total).sum + @other) * @order.discount/100
          @order.update(total: discounted, disc: @disc)
        else
          @order.update(total: (OrderProduct.where(order_id: @order.id).pluck(:total).sum + @other))
        end

        format.html { redirect_to @order }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
      else
      format.html { redirect_to edit_order_path(@order), alert:"Please select at least 1 product to continue." } 
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
        redirect_to  new_order_path, alert: "You are not allowed to check orders" 
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:customer_name, :user_id, :special_notes, :address, :contact_number, :discount, :customer, :disc, :other_charges, :quntities => [], :product_ids => [])
    end
end
