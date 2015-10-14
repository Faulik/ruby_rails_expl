class AddHstoreToPost < ActiveRecord::Migration
  def up
    execute 'CREATE EXTENSION IF NOT EXISTS hstore;'

    add_column :posts, :settings, :hstore, default: '', null: false
  end

  def down
    execute 'DROP EXTENSION IF EXIST hstore'

    add_column :posts, :settings
  end
end
