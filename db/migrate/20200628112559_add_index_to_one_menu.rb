class AddIndexToOneMenu < ActiveRecord::Migration[5.2]
  def change
    add_column :one_menus, :index, :integer, default: 1
  end
end
