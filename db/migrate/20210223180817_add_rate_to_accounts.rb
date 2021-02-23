class AddRateToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :rate, :integer, default: 0
  end
end
