class AddEditedToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :edited, :boolean, default: false
  end
end
