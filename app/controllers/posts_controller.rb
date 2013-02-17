class PostsController < ApplicationController

  def index
    @user = current_user
    @posts = @user.posts.all
  end

  def drop
    @post = Post.find(params[:post_id])
    @post.destroy
    redirect_to action: :index
  end

  def new
    @user = current_user
  end

  def show
    @post = current_user.posts.find(params[:post_id])
  end

  def create
    @user = current_user
    @post = @user.posts.new(params[:post])
    @post.save
    redirect_to action: :index
  end

end
