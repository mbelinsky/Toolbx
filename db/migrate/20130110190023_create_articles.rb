class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.references :author
      t.text :body

      t.timestamps
    end
    add_index :articles, :author_id
  end
end
