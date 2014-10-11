class CreateRoundups < ActiveRecord::Migration
  def change
    create_table :roundups do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
