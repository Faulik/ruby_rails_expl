FactoryGirl.define do
  factory :comment do
    author_name 'Name'
    author_email 'email@dot.com'
    content 'Comment content'
    target_type 'Article'
  end
end