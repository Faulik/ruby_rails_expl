# == Schema Information
#
# Table name: content_views
#
#  id         :integer
#  title      :text
#  type       :text
#  slug       :text
#  content    :text
#  address    :text
#  started_at :datetime
#  tag_slugs  :text             is an Array
#  created_at :datetime
#  updated_at :datetime
#

class ContentView < ActiveRecord::Base
  self.table_name = 'content_views'

  paginates_per 10

  scope :any_tags, -> (tags) { where('tag_slugs && ARRAY[?]', Array.wrap(tags)) }
  scope :recently, -> { order(created_at: :desc) }

  def readonly?
    true
  end
end
