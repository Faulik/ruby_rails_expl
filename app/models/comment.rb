class Comment < ActiveRecord::Base
  validates :content, presence: true
  paginates_per 5

  belongs_to :target, polymorphic: true
end
