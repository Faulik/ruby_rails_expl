FactoryGirl.define do
  factory :post do
    title 'Post title'
    content 'Post content'
    slug 'post_slug'
    tag_slugs ['one', 'two']
    settings { { title_bg_color: 'success'} }
  end
end 