class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :short_name
      t.references :continent
      t.integer :dial_code

      t.timestamps
    end
    add_index :countries, :continent_id
  end
end
