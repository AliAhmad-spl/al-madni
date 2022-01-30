class AddTotalToMeats < ActiveRecord::Migration[5.2]
  def change
    add_column :meats, :total, :integer
  end
end
