class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    p '-'*20
    p 'params is'
    p params
    p 'params[:post] is'
    p params[:post]
    p 'title is'
    p params[:post][:title]
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]

    if false#@post.save
      flash[:notice] = "Post was saved successfully."
      redirect_to @post # post_path(@post) => '/posts/151'
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]

    if @post.save
      flash[:notice] = "Post was updated successfully."
      redirect_to @post
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
      redirect_to posts_path # "/posts"
      # render :index # /posts/234
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end
end
