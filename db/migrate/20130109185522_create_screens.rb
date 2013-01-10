class CreateScreens < ActiveRecord::Migration
  def change
    create_table :screens do |t|
      t.references :tool

      t.timestamps
    end
  end
end
