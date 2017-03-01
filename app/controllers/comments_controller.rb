class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to root_path(anchor: "post_#{@post.id}")
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to root_path(anchor: "post_#{@post.id}")
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end
end
