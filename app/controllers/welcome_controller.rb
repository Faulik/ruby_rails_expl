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
    Tag.all.each do |tag|
      _count = ContentView.any_tags(tag.slug).count
      _tags << { tag: tag, count: _count.round(-1) }
    end
    _tags
  end
end
