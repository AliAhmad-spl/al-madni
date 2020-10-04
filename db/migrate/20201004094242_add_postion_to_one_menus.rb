class AddPostionToOneMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :one_menus, :position, :integer
  end
end
