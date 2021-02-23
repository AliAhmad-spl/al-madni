class CreateDeposits < ActiveRecord::Migration[5.2]
  def change
    create_table :deposits do |t|
      t.string :amount
      t.integer :account_id

      t.timestamps
    end
  end
end
