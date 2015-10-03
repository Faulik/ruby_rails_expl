class AddDefaultToComments < ActiveRecord::Migration
  def change
    change_column_default :comments, :author_name, 'Anonymous'
    change_column_default :comments, :author_email, 'anonymous@dot.com'
  end
end
