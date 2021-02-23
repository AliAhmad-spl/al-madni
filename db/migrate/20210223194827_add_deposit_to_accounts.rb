class AddDepositToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :deposit, :integer, default: 0 
  end
end
