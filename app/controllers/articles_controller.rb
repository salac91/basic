class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :destroy]
  
  def show 
  end 

  def new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to root_path, notice: 'Article was successfully created.'  
  end

  def destroy 
    if @article.author?(current_user)
      @article.destroy
      redirect_to root_path, notice: 'Article was successfully removed.'
    else
      redirect_to root_path, alert: 'Only article author can remove it!'
    end
  end

  private 

    def article_params
      params.require(:article).permit(:title, :description, :user_id)
    end

    def find_article
      @article = Article.find(params[:id])
    end
end
