class AddDiscToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :disc, :integer, default: 0
  end
end
