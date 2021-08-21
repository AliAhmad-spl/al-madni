class ChangeMilkColumns < ActiveRecord::Migration[5.2]
  def up
    change_column :detail_milks, :milk, :float
    change_column :detail_milks, :weight, :float
  end

  def down
    change_column :detail_milks, :weight, :integer
    change_column :detail_milks, :milk, :integer
  end
end
