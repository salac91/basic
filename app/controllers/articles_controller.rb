class ArticlesController < ApplicationController
  include ArticlesHelper

  def show 
    @article = Article.find(params[:id])
    @user = User.find(@article.user_id)
    @comments = Comment.where(article_id: params[:id])
    @comment = Comment.new
  end 

  def new
    @article = Article.new
    @user = current_user
    @article.user_id = @user.id
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.save
    redirect_to root_path, notice: 'Article was successfully created.'
  end

  def destroy 
    @article = Article.find(params[:id])
    if current_user.id == @article.user_id
      send_mails(@article) if @article.destroy
    end
    redirect_to root_path, notice: 'Article was successfully removed.'
  end

  private 

    def article_params
      params.require(:article).permit(:title, :description, :user_id)
    end
end
