# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :text
#  slug       :text
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_slugs  :text             default([]), is an Array
#  settings   :hstore           default({}), not null
#

require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is valid with a title and content' do
    expect(FactoryGirl.build(:post)).to be_valid
  end

  it 'is invalid without title' do
    expect(FactoryGirl.build(:post, title: nil)).not_to be_valid
  end

  it 'is invalid without content' do
    expect(FactoryGirl.build(:post, content: nil)).not_to be_valid
  end

  it 'is invalid with to short title' do
    expect(FactoryGirl.build(:post, title: '123')).not_to be_valid
  end
end
