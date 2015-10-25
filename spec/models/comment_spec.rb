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
  it 'is valid with a author_name, author_email, target_type and content' do
    expect(FactoryGirl.build(:comment)).to be_valid
  end

  it 'is invalid without content' do
    expect(FactoryGirl.build(:comment, content: nil)).not_to be_valid
  end

  it 'is invalid without target_type' do
    expect(FactoryGirl.build(:comment, target_type: nil)).not_to be_valid
  end
end