class ArticlesController < ApplicationController
  # basic auth
  http_basic_authenticate_with name: "matbot", password: "matbot", except: [:index, :show]

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
    @article = Article.new
  end
  # edit
  def edit
    @article = Article.find(params[:id])
  end
  # create
  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
  # update
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
  # destroy
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end
  #

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
