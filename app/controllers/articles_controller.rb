class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :destroy]
  
  def show 
  end 

  def new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.save
    redirect_to root_path, notice: 'Article was successfully created.'
  end

  def destroy 
    if @article.author?(current_user)
      @article.destroy
    end
    redirect_to root_path, notice: 'Article was successfully removed.'
  end

  private 

    def article_params
      params.require(:article).permit(:title, :description, :user_id)
    end

    def find_article
      @article = Article.find(params[:id])
    end
end
