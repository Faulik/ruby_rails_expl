class ContentView < ActiveRecord::Base
  self.table_name = 'content_views'

  paginates_per 10

  scope :any_tags, -> (tags) { where('tag_slugs && ARRAY[?]', Array.wrap(tags)) }
  scope :recently, -> { order(created_at: :desc) }

  def readonly?
    true
  end
end
