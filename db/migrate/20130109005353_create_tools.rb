class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :name
      t.decimal :cost, precision: 6, scale: 2
      t.text :description
      t.string :github_url
      t.string :google_play_url
      t.string :app_store_url
      t.string :site_url
      t.boolean :featured, default: false
      t.references :license

      t.timestamps
    end
    add_index :tools, :license_id
  end
end
