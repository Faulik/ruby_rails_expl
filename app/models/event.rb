class Event < ActiveRecord::Base
  validates :title, presence: true
  validates :address, presence: true
  validates :started_at, presence: true

  paginates_per 6

  has_many :comments, as: :target
end
