class DataIssueFix < ActiveRecord::Migration[5.2]
  def change
  	add_column :orders, :other_charges, :integer, default: 0
	  Order.all.each do |order|
	  	@products = Product.where(id: order.product_ids)
		@products.each_with_index do |p, i|
		  p.update(order_id: order.id, quntity: order.index[i], total: p.price*order.index[i])
		end
	  end
  end
end
