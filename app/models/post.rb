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
#

class Post < ActiveRecord::Base
  include Taggable

  validates :title, presence: true, length: { minimum: 4 }
  validates :content, presence: true

  paginates_per 5

  has_many :comments, as: :target
end
