class CreateArticleCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :article_categories do |t|
      t.references :article, null: true, foreign_key: true
      t.references :category, null: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
