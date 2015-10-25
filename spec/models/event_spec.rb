# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :text
#  address    :text
#  started_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_slugs  :text             default([]), is an Array
#

require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'is valid with a title, address and started_at' do
    expect(FactoryGirl.build(:event)).to be_valid
  end

  it 'is invalid without title' do
    expect(FactoryGirl.build(:event, title: nil)).not_to be_valid
  end

  it 'is invalid without address' do
    expect(FactoryGirl.build(:event, address: nil)).not_to be_valid
  end

  it 'is invalid without started_at' do
    expect(FactoryGirl.build(:event, started_at: nil)).not_to be_valid
  end

  it 'is invalid with to short title' do
    expect(FactoryGirl.build(:event, title: '123')).not_to be_valid
  end
end