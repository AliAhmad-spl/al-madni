class AddCustomerToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :customer, :boolean
  end
end
