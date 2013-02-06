class ChangeToolSocialUrlsToUsernames < ActiveRecord::Migration
  def change
    rename_column :tools, :twitter_url, :twitter_username
    rename_column :tools, :facebook_url, :facebook_username
  end
end
