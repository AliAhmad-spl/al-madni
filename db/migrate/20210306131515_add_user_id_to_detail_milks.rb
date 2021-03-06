class AddUserIdToDetailMilks < ActiveRecord::Migration[5.2]
  def change
    add_column :detail_milks, :user_id, :integer
  end
end
