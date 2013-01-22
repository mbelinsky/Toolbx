class CreateArticleTools < ActiveRecord::Migration
  def change
    create_table :article_tools do |t|
      t.references :article
      t.references :tool

      t.timestamps
    end
    add_index :article_tools, :article_id
    add_index :article_tools, :tool_id
  end
end
