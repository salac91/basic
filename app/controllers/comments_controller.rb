class CommentsController < ApplicationController

  def create
    @comment = Comment.new(
      body: params[:comment][:body],
      author_id: current_user.id,
      article_id: params[:article_id])
    @comment.save
    redirect_to user_article_path(params[:user_id], 
            params[:article_id])
  end

  def update 
    @comment = Comment.find(params[:id])
    @comment.update(abuse_count: @comment.abuse_count + 1)
    @comment.overabused?
    redirect_to user_article_path(params[:user_id], 
            params[:article_id])
  end 

end
