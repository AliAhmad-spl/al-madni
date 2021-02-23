class AddStatusToDeposits < ActiveRecord::Migration[5.2]
  def change
    add_column :deposits, :status, :integer, default: 0
  end
end
