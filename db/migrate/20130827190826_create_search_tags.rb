class CreateSearchTags < ActiveRecord::Migration
  def change
    create_table :search_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
