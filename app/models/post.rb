# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :text
#  slug       :text
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_slugs  :text             default([]), is an Array
#  settings   :hstore           default({}), not null
#

class Post < ActiveRecord::Base
  include Taggable
  include CustomFields

  validates :title, presence: true, length: { minimum: 4 }
  validates :content, presence: true

  custom_fields :title_bg_color, :font_size

  paginates_per 5

  has_many :comments, as: :target
end
