class TagsController < ApplicationController
  before_action :find_tag

  def index
    
  end

  def show
    @posts = Post.any_tags(@tag.slug).order(:id).limit(50)
  end

  protected

  def find_tag
    @tag = Tag.where(slug: params[:id]).first
  end
end
