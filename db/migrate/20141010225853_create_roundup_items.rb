class CreateRoundupItems < ActiveRecord::Migration
  def change
    create_table :roundup_items do |t|
      t.references :roundup
      t.references :item, polymorphic: true

      t.timestamps
    end
    add_index :roundup_items, :roundup_id
  end
end
