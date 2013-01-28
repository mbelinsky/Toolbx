class AddSocialUrlsToTools < ActiveRecord::Migration
  def change
    add_column :tools, :facebook_url, :string
    add_column :tools, :twitter_url, :string
  end
end
