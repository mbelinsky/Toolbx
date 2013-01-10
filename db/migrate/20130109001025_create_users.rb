class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :password_digest
      t.string :facebook_username
      t.string :twitter_username
      t.string :linkedin_username
      t.string :website_url
      t.integer :sector_cd
      t.text :description
      t.references :city

      t.timestamps
    end
    add_index :users, :city_id
  end
end
