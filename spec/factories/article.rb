FactoryGirl.define do
  factory :article do
    title 'Article title'
    content 'Article content'
    slug 'article_slug'
    tag_slugs ['one', 'two']
  end
end