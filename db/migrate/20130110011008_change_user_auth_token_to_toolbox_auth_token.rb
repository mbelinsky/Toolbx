class ChangeUserAuthTokenToToolboxAuthToken < ActiveRecord::Migration
  def change
    rename_column :users, :auth_token, :toolbox_auth_token
  end
end
