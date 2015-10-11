class TagsController < ApplicationController
  before_action :find_tag

  def show
    @content = ContentView.any_tags(@tag.slug).order(:id).page params[:page]
  end

  protected

  def find_tag
    @tag = Tag.where(slug: params[:id]).first
  end
end
