# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :text
#  slug       :text
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_slugs  :text             default([]), is an Array
#

require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'is valid with a title,slug and content' do
    expect(FactoryGirl.build(:article)).to be_valid
  end

  it 'is invalid without title' do
    expect(FactoryGirl.build(:article, title: nil)).not_to be_valid
  end

  it 'is invalid without content' do
    expect(FactoryGirl.build(:article, content: nil)).not_to be_valid
  end

  it 'is invalid without slug' do
    expect(FactoryGirl.build(:article, slug: nil)).not_to be_valid
  end

  it 'is invalid with to short title' do
    expect(FactoryGirl.build(:article, title: '123')).not_to be_valid
  end
end