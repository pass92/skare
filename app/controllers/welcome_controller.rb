class WelcomeController < ApplicationController
  def index
    @error = session[:error]
    if @error == true
      flash[:error] = "Something wrong with your signup procedure"
    elsif @error == false
      flash[:success] = "User successfully created you can now log in"
    else
      flash = nil
    end
    session[:error] = nil
  end
end
