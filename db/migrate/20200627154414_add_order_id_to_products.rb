class AddOrderIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :order_id, :integer
  end

  def down
  	
  end
end
