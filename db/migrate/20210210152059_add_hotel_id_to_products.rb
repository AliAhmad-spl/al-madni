class AddHotelIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :hotel_id, :integer
  end
end
