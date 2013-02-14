class UsersController < ApplicationController

  def authenticate
    @user = User.find_by_email(params[:auth_user][:email])
    if @user && @user.authenticate(params[:auth_user][:password])
      sign_in @user
      session[:user_id] = @user.id
      redirect_to action: :show
    else
      session[:signin_error] = true
      redirect_to controller: :welcome, :action => :index
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  def create
    @user = User.new(params[:new_user])
    if @user.save
      session[:signup_error] = false
      redirect_to controller: :welcome, :action => :index 
    else
      session[:signup_error] = true
      redirect_to controller: :welcome, :action => :index
    end
  end
end
