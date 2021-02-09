class AddHotelIdToOneMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :one_menus, :hotel_id, :integer
  end
end
