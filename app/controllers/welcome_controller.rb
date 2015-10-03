class WelcomeController < ApplicationController
  def index
    @posts = Post.last(3).reverse
    @articles = Article.last(3).reverse
    @events = Event.last(3).reverse
  end
end
