class PostsController < ApplicationController

  def index
    @user = current_user
    @posts = @user.posts.all
  end

  def edit
    @post = current_user.posts.find(params[:post_id])
  end

  def update
    @post = current_user.posts.find(params[:post_id])
    if @post.update_attributes(:title => params[:edited][:title], :body => params[:edited][:body])
      redirect_to action: :index
    else
      redirect_to controller: :users, action: :show
    end
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
