class ChangeIndexAlso < ActiveRecord::Migration[5.2]
  def change
  	change_column :orders, :index, :float, array: true, default: []
  end
end
