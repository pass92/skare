class WelcomeController < ApplicationController
  def index
    @error = session[:error]
    session[:error] = nil
  end
end
