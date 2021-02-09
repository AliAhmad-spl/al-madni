class CreateHotels < ActiveRecord::Migration[5.2]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :contact
      t.string :address
      t.integer :user_id
      
      t.timestamps
    end
  end
end
