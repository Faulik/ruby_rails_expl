class AddTagSlugsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :tag_slugs, :text, array: true, default: []
    add_index :events, :tag_slugs, using: 'gin'
  end
end
