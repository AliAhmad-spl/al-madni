class AddTotalToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :total, :integer, defualt: 0
  end
end
