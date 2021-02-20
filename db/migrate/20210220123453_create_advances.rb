class CreateAdvances < ActiveRecord::Migration[5.2]
  def change
    create_table :advances do |t|
      t.integer :amount
      t.integer :account_id

      t.timestamps
    end
  end
end
