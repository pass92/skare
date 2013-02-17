class WelcomeController < ApplicationController
  def index
    @signup = session[:signup]
    @signin = session[:signin]
    @signup_error = session[:signup_error] if @signup
    @signin_error = session[:signin_error] if @signin
    flash.now[:error] = "Something went wrong with your signup procedure" if session[:signup]
    flash.now[:success] = "User successfully created you can now log in" if !session[:signup] && !session[:signup].nil?
    flash.now[:error] = "Invalid username or password, retry login !" if session[:signin]
    flash = nil
    session[:signup] = session[:signin] = nil
  end
  
  
end
