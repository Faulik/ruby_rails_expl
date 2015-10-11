# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  author_name  :text             default("Anonymous")
#  author_email :text             default("anonymous@dot.com")
#  content      :text
#  target_id    :integer
#  target_type  :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Comment < ActiveRecord::Base
  validates :content, presence: true
  paginates_per 5

  belongs_to :target, polymorphic: true
end
