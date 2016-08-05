class Api::V1::PostsController < Api::V1::BaseController
  p "before auth"
  before_action :authenticate_user
  before_action :authorize_user
  p "after authenticate and authorize"
  def update
    post = Post.find(params[:id])

    if post.update_attributes(post_params)
      render json: post, status: 200
    else
      render json: {error: "Post update failed", status: 400}, status: 400
    end
  end

  def create
    p "in create method"
    p "find topic with id:", params[:id]
    topic = Topic.find(params[:topic_id])
    p "found topic:", topic
    post = topic.posts.build(post_params)
    p "after post build:"
    post.user = current_user
    

    if post.valid?

      p "post is valid"
      post.save!
      render json: post, status: 201
    else
      p post.errors
      p "post is invalid"
      render json: {error: "Post is invalid", status: 400}, status: 400
    end
  end

  def destroy
    post = Post.find(params[:id])

    if post.destroy
      render json: {message: "Post destroyed", status: 200}, status: 200
    else
      render json: {error: "Post destroy failed", status: 400}, status: 400
    end
  end



  private

  def post_params
    p "in post params"
    params.require(:post).permit(:title, :body, :topic_id)
  end
end