class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :short_name
      t.references :region
      t.references :country

      t.timestamps
    end
    add_index :cities, :region_id
    add_index :cities, :country_id
  end
end
