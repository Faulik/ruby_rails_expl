# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  slug       :text
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Tag, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
