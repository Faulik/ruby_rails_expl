# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :text
#  slug       :text
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_slugs  :text             default([]), is an Array
#

class Article < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 4 }
  validates :content, presence: true
  validates :slug, presence: true

  paginates_per 5

  has_many :comments, as: :target

  has_one :picture, as: :assetable, dependent: :destroy
  accepts_nested_attributes_for :picture
end
