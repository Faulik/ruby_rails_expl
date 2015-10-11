class AddTagSlugsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :tag_slugs, :text, array: true, default: []
    add_index :articles, :tag_slugs, using: 'gin'
  end
end
