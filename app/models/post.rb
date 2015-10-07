class Post < ActiveRecord::Base
  include Taggable

  validates :title, presence: true, length: { minimum: 4 }
  validates :content, presence: true

  paginates_per 3

  has_many :comments, as: :target
end
