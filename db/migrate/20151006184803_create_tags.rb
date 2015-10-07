class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.text :slug
      t.text :name

      t.timestamps null: false
    end
  end
end
