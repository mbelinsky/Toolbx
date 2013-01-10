class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.string :short_name
      t.references :country

      t.timestamps
    end
    add_index :regions, :country_id
  end
end
