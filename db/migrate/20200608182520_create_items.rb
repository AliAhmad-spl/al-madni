class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :quantity
      t.boolean :deleted, default: false, null: false
      t.integer :qty_type, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
