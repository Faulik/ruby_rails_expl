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

class Tag < ActiveRecord::Base
  def to_param
    slug
  end
end
