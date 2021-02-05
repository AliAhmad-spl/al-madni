class Name < ActiveRecord::Migration[5.2]
  def change
  	add_column :orders, :contact_number, :string
  	add_column :orders, :address, :string
  	add_column :orders, :special_notes, :text
  end
end
