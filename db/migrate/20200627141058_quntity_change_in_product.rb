class QuntityChangeInProduct < ActiveRecord::Migration[5.2]
  def change
  	change_column :products, :quntity, :float, default: 1.0
  end
end
