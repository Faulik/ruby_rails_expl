require 'populator'
require 'faker'

namespace :populate do
  desc 'Create random articles'
  task articles: [:environment] do
    _tags = Tag.all.pluck(:slug)
    Article.populate(20..30) do |article|
      article.title = Faker::Book.title
      article.slug = Faker::Internet.slug
      article.content = Populator.paragraphs(6)
      article.tag_slugs = _tags.sample(5).to_s.tr('[', '{').tr(']', '}')
      Comment.populate(20..30) do |comment|
        comment.target_id = article.id
        comment.target_type = 'Article'
        comment.author_name = Faker::Name.name
        comment.author_email = Faker::Internet.safe_email
        comment.content = Faker::Lorem.sentence(5)
      end
    end
  end

  desc 'Create random events'
  task events: [:environment] do
    _tags = Tag.all.pluck(:slug)
    Event.populate(20..30) do |event|
      event.title = Faker::Book.title
      event.address = Faker::Address.street_address
      event.started_at = Faker::Date.forward(100)
      event.tag_slugs = _tags.sample(5).to_s.tr('[', '{').tr(']', '}')
      Comment.populate(20..30) do |comment|
        comment.target_id = event.id
        comment.target_type = 'Event'
        comment.author_name = Faker::Name.name
        comment.author_email = Faker::Internet.safe_email
        comment.content = Faker::Lorem.sentence(5)
      end
    end
  end

  desc 'Create random posts'
  task posts: [:environment] do
    _tags = Tag.all.pluck(:slug)
    Post.populate(20..30) do |post|
      post.title = Faker::Book.title
      post.slug = Faker::Internet.slug
      post.content = Populator.paragraphs(6)
      post.tag_slugs = _tags.sample(5).to_s.tr('[', '{').tr(']', '}')
      Comment.populate(20..30) do |comment|
        comment.target_id = post.id
        comment.target_type = 'Post'
        comment.author_name = Faker::Name.name
        comment.author_email = Faker::Internet.safe_email
        comment.content = Faker::Lorem.sentence(5)
      end
    end
  end

  desc 'Create random tags'
  task tags: [:environment] do
    _tags = Faker::Lorem.words(20).uniq
    Tag.populate(_tags.count) do |tag|
      _tag = _tags.pop
      tag.name = _tag
      tag.slug = _tag
    end
  end
end
