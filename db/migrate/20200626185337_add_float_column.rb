class AddFloatColumn < ActiveRecord::Migration[5.2]
  def change
  	change_column :orders, :quntities, :float, array: true, default: []
  end
end
