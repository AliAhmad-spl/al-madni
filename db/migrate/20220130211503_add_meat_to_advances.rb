class AddMeatToAdvances < ActiveRecord::Migration[5.2]
  def change
    add_column :advances, :meat, :boolean, default: false
  end
end
