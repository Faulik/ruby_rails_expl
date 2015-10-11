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
#

class Article < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true
  validates :slug, presence: true

  paginates_per 3

  has_many :comments, as: :target

  has_one :picture, as: :assetable, dependent: :destroy
  accepts_nested_attributes_for :picture
end
