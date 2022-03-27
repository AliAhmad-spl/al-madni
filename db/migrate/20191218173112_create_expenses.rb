class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :description
      t.integer :amount
      t.string :current_sales_person_name

      t.timestamps
    end
  end
end
