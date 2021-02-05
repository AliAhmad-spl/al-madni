class AddProductIdsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :product_ids, :string, array: true, default: []
  end
end
