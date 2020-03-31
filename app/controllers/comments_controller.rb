class CommentsController < ApplicationController
  def create
    @comment = Comment.new
    @comment.user = current_user
    @comment.post = Post.find(params[:post_id])
    @comment.content = params[:content]
    @comment.save
  end
end
