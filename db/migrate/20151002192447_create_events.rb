class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :title
      t.text :address
      t.datetime :started_at

      t.timestamps null: false
    end
  end
end
