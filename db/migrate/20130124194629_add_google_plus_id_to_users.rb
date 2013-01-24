class AddGooglePlusIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :google_plus_id, :string
  end
end
