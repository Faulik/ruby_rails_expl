class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.text :filename
      t.text :content_type
      t.integer :file_size

      t.references :assetable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
