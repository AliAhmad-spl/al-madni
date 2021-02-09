class CreateUserRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :user_requests do |t|
      t.integer :hotel_id
      t.integer :user_id
      t.boolean :approve, default: false
      t.boolean :pending, default: true

      t.timestamps
    end
  end
end
