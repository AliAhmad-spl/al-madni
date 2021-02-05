class AddDiscountToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :discount, :integer, default: 0
  end
end
