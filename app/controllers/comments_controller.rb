class CommentsController < ApplicationController
  def index
    @comments = Comment.order('updated_at DESC').page params[:page]
  end

  def create
    @comment = @commentable.comments.new comment_params
    if @comment.save
      redirect_to @commentable
    else
      render action: 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :author_name, :author_email)
  end
end
