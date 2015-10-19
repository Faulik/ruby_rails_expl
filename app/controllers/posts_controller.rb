class PostsController < ApplicationController
  def index
    @posts = Post.order('updated_at DESC').page params[:page]
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order('updated_at DESC').page params[:page]
    @tags = @post.tag_slugs
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :slug, :title_bg_color,
                                 :font_size, tag_slugs: [])
  end
end
