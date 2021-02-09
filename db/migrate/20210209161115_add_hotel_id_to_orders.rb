class AddHotelIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :hotel_id, :integer
  end
end
