class UsersController < ApplicationController

  def authenticate
    #current_user = params[:auth_user]
    @user = User.find_by_email(params[:email])
    if !@user.nil?
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to action: :show
      else
        redirect_to controller: :welcome, :action => :index
      end
    else
      redirect_to controller: :welcome, :action => :index
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

end
