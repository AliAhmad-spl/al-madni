class AddIceToOneMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :one_menus, :ice, :boolean, default: false
  end
end
