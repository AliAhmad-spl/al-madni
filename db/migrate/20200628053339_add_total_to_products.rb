class AddTotalToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :total, :integer, default: 0
  end
end
