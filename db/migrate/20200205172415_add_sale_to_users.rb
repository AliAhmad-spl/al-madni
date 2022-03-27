class AddSaleToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sale, :boolean, default: false
    add_column :orders, :status, :integer, default: 0
  end
end
