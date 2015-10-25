FactoryGirl.define do
  factory :event do
    title 'Event title'
    address 'Event address'
    started_at '2015-12-12 12:12:12'
    tag_slugs ['one', 'two']
  end
end