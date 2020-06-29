class AddTotal < ActiveRecord::Migration[5.2]
  def change
  	  	add_column :products, :total, :integer
  end
end
