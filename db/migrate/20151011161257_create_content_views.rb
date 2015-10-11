class CreateContentViews < ActiveRecord::Migration
  def up
    execute("
      CREATE OR REPLACE VIEW content_views AS
        SELECT id, title,    'Post' AS type,         slug, NULL as content, NULL as address, to_date(NULL, NULL) as started_at, tag_slugs, created_at, updated_at FROM posts
        UNION
        SELECT id, title, 'Article' AS type,         slug,         content, NULL as address, to_date(NULL, NULL) as started_at, tag_slugs, created_at, updated_at FROM articles
        UNION
        SELECT id, title,   'Event' AS type, NULL as slug, NULL as content,         address,                        started_at, tag_slugs, created_at, updated_at FROM events
    ")
  end
  
  def down
    execute('DROP VIEW content_views;')
  end
end
