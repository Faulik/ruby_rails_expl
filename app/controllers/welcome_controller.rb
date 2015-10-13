class WelcomeController < ApplicationController
  def index
    @posts = Post.last(3).reverse
    @articles = Article.last(3).reverse
    @events = Event.last(3).reverse
    @tag_cloud = count_tags
  end

  private

  def count_tags
    _tags = []
    _count = count_tags_enries

    Tag.all.each do |tag|
      _tags << { tag: tag, count: _count[tag.slug].round(-1) }
    end
    _tags
  end

  def count_tags_enries
    _slugs = ContentView.all.pluck(:tag_slugs).flatten
    _slugs.each_with_object(Hash.new(0)) { |slug, hash| hash[slug] += 1 }
  end
end
