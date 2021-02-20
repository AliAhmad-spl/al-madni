class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :phone
      t.integer :credit, default: 0
      t.integer :advance, default: 0
      t.integer :hotel_id
      t.integer :user_type, default: 0

      t.timestamps
    end
  end
end
