class AddUserLevelToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user_level, :integer
  end
end
