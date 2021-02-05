class AddQuntityToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :quntities, :integer, array: true, default: []
  end
end
