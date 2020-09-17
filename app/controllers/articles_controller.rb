class ArticlesController < ApplicationController
  # index
  def index
    @articles = Article.all
  end
  # show
  def show
    @article = Article.find(params[:id])
  end
  # new
  def new
  end
  # edit
  # create
  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.save
    redirect_to @article
  end
  # update
  # destroy
  #



  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
