class CommentsController < ApplicationController
  def index
    @comments = Comment.order('updated_at DESC').page params[:page]
  end

  def show
    # @comment = Comment.find(params[:id])
  end

  def update
  end

  def new
  end

  def create
    @comment = @commentable.comments.new comment_params
    if @comment.save
      redirect_to @commentable
    else
      render action: 'new'
    end
  end

  def destroy
  end

  def edit
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :author_name, :author_email)
  end
end
