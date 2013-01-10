class CreateUserTools < ActiveRecord::Migration
  def change
    create_table :user_tools do |t|
      t.references :user
      t.references :tool

      t.timestamps
    end
    add_index :user_tools, :user_id
    add_index :user_tools, :tool_id
  end
end
