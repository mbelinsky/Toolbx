class AddApptivistToUsers < ActiveRecord::Migration
  def change
    add_column :users, :apptivist, :boolean, default: false
    add_column :users, :role, :string
    add_column :users, :appstore_url, :string
    add_column :users, :google_play_url, :string
    add_column :users, :github_url, :string
  end
end
