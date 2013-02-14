class WelcomeController < ApplicationController
  def index
    
    @user = check_token
    if @user
      session[:user_id] = @user.id
      redirect_to :controller => :users, :action => :show
    end
    
    @signup_error = session[:signup_error]
    @signin_error = session[:signin_error]
    if @signup_error == true
      flash.now[:error] = "Something wrong with your signup procedure"
    elsif @signup_error == false
      flash.now[:success] = "User successfully created you can now log in"
    elsif @signin_error == true
      flash.now[:error] = "Invalid username or password, retry login !"
    else
      flash = nil
    end
    session[:signup_error] = session[:signin_error] = nil
  end
  
  def check_token
     current_user
  end
  
end
