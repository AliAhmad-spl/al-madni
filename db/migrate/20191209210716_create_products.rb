class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :quntity
      t.integer :price
      t.integer :one_menu_id

      t.timestamps
    end
  end
end
