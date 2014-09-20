class CreateApptivistTools < ActiveRecord::Migration
  def change
    create_table :apptivist_tools do |t|
      t.references :apptivist
      t.references :tool

      t.timestamps
    end
    add_index :apptivist_tools, :apptivist_id
    add_index :apptivist_tools, :tool_id
  end
end
