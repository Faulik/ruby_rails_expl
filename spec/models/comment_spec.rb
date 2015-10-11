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

require 'rails_helper'

RSpec.describe Comment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
