class CreateMeats < ActiveRecord::Migration[5.2]
  def change
    create_table :meats do |t|
      t.float :qty
      t.integer :price
      t.integer :cat_type, default: 0
      t.references :accounts, foreign_key: true

      t.timestamps
    end
  end
end
