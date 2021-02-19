class CreateDetailMilks < ActiveRecord::Migration[5.2]
  def change
    create_table :detail_milks do |t|
      t.integer :milk, default: 0
      t.integer :weight, default: 0
      t.integer :account_id
      t.integer :rate
      t.integer :total, default: 0
      t.integer :amount, default: 0

      t.timestamps
    end
  end
end
