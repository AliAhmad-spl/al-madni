class AddIndexToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :index, :integer, array: true, default: []
  end
end
