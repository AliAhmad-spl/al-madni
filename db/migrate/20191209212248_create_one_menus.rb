class CreateOneMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :one_menus do |t|
      t.string :name

      t.timestamps
    end
  end
end
