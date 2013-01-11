class Tool < ActiveRecord::Base
  belongs_to :license
  has_many :users, through: :user_tools
  has_many :screens
  attr_accessible :app_store_url, :cost, :description, :featured, :github_url, :google_play_url, :name, :site_url, :license_id, :icon

  validates_presence_of :name, :description, :icon, :license

  has_attached_file :icon, styles: { small: "120x120#", thumb: "60x60#" }
end
