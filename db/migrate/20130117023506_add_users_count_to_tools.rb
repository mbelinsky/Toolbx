class AddUsersCountToTools < ActiveRecord::Migration
  def change
    add_column :tools, :users_count, :integer
  end
end
