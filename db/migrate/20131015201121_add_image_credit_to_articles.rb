class AddImageCreditToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :image_credit, :string
  end
end
