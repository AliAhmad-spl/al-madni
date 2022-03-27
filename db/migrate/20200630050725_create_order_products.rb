class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.float :quntity
      t.integer :price
      t.string :name
      t.integer :total
      t.integer :order_id

      t.timestamps
    end
  end
end
