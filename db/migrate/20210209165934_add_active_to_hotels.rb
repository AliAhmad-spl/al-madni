class AddActiveToHotels < ActiveRecord::Migration[5.2]
  def change
    add_column :hotels, :active, :boolean, default: false
  end
end
