class CommentsController < ApplicationController
  before_action :find_comment, only: [:abuse]

  def create
    @comment = Comment.new(
      body: params[:comment][:body],
      author_id: current_user.id,
      article_id: params[:article_id])
    @comment.save
    redirect_to user_article_path(params[:user_id], 
            params[:article_id])
  end

  def abuse 
    @comment.abuse!
    @comment.overabused? 
    redirect_to user_article_path(params[:user_id], 
            params[:article_id])
  end

  private 

    def find_comment
      @comment = Comment.find(params[:id])
    end
end
