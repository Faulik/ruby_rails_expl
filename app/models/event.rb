# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :text
#  address    :text
#  started_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_slugs  :text             default([]), is an Array
#

class Event < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 4 }
  validates :address, presence: true
  validates :started_at, presence: true

  paginates_per 6

  has_many :comments, as: :target
end
