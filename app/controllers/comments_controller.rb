class CommentsController < ApplicationController
  before_action :find_comment, only: [:abuse]

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to user_article_path(params[:user_id], 
      params[:article_id]), notice: 'Comment was successfully created.'
  end

  def abuse 
    @comment.abuse!
    @comment.overabused? 
    redirect_to user_article_path(params[:user_id], 
      params[:article_id]), notice: 'Comment was removed because overabused.'
  end

  private 

    def comment_params
      params.require(:comment).permit(:body, :user_id, :article_id)
    end

    def find_comment
      @comment = Comment.find(params[:id])
    end
end
