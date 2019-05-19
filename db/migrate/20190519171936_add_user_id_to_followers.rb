class AddUserIdToFollowers < ActiveRecord::Migration[5.2]
  def change
    add_column :followers, :user_id, :integer
  end
end
