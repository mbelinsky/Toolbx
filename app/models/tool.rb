class Tool < ActiveRecord::Base
  belongs_to :license
  has_many :users, through: :user_tools
  has_many :screens
  attr_accessible :app_store_url, :cost, :description, :featured, :github_url, :google_play_url, :name, :site_url

  has_attached_file :icon, styles: { small: "100x100>", thumb: "75x75>" }
end
