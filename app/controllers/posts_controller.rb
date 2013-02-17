class PostsController < ApplicationController

  def index
    @user = current_user
    @posts = @user.posts.all
  end

  def new
    @user = current_user
  end

  def create
    @user = current_user
    @post = @user.posts.new(params[:post])
    @post.save
    redirect_to action: :index
  end

end
