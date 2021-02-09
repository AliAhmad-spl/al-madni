class CreateUserHotels < ActiveRecord::Migration[5.2]
  def change
    create_table :user_hotels do |t|
      t.integer :user_id
      t.integer :hotel_id

      t.timestamps
    end
  end
end
