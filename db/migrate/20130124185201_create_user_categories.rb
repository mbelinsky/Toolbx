class CreateUserCategories < ActiveRecord::Migration
  def change
    create_table :user_categories do |t|
      t.references :user
      t.references :category

      t.timestamps
    end
    add_index :user_categories, :user_id
    add_index :user_categories, :category_id
  end
end
