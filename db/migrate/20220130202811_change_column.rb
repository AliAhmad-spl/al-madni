class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :meats, :accounts_id, :integer
    add_column :meats, :account_id, :integer
  end
end
