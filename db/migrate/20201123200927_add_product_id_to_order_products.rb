class AddProductIdToOrderProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :order_products, :product_id, :integer
  end
end
