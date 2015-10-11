class ArticlesController < ApplicationController
  def index
    @articles = Article.page params[:page]
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.page params[:page]
    @tags = @article.tag_slugs
  end

  def new
    @article = Article.new
    @article.build_picture
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :slug, picture_attributes: [:data])
  end
end
