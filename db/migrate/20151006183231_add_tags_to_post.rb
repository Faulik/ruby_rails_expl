class AddTagsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :tag_slugs, :text, array: true, default: []
    add_index :posts, :tag_slugs, using: 'gin'
  end
end
