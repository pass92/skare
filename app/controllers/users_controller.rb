class UsersController < ApplicationController

  def index
    @users = User.paginate(:page => params[:page])
  end

  def show
    @user = current_user
    redirect_to controller: :welcome, action: :index if @user.nil?
  end

  def create
    @user = User.new(params[:new_user])
    if @user.save
      session[:signup] = false
      redirect_to controller: :welcome, :action => :index 
    else
      session[:signup] = true
      session[:signup_error] = @user.errors.full_messages
      redirect_to controller: :welcome, :action => :index
    end
  end

  def destroy
    current_user.destroy
    redirect_to root_url
  end

end
