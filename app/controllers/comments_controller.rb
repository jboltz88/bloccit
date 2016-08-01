class CommentsController < ApplicationController
  before_action :require_sign_in
  before_action :authorize_user, only: [:destroy]

  def create
    if params[:topic_id]
      @topic = Topic.find(params[:topic_id])
      comment = @topic.comments.new(comment_params)
    elsif params[:post_id]
      @post = Post.find(params[:post_id])
      comment = @post.comments.new(comment_params)
    end
    comment.user = current_user

    if comment.save
      flash[:notice] = "Comment saved successfully."
      redirect_to :back
    else
      flash[:alert] = "Comment failed to save."
      redirect_to :back
    end
  end

  def destroy
    if params[:topic_id]
      @topic = Topic.find(params[:topic_id])
      comment = @topic.comments.find(params[:id])
    end
    if params[:post_id]
      @post = Post.find(params[:post_id])
      comment = @post.comments.find(params[:id])
    end

    if comment.destroy
      flash[:notice] = "Comment was deleted successfully."
      redirect_to :back
    else
      flash[:alert] = "Comment couldn't be deleted."
      redirect_to :back
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def authorize_user
    comment = Comment.find(params[:id])
    unless current_user == comment.user || current_user.admin?
      flash[:alert] = "You do not have permission to delete a comment."
      redirect_to new_session_path
    end
  end
end
