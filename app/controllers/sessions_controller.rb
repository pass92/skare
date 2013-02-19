class SessionsController < ApplicationController

  def new
  end
  
  def create
    @user = User.find_by_email(params[:session][:email].downcase)
    @user.authenticate(params[:session][:password])
    @user.password = @user.password_confirmation = "scroto"
    if @user && @user.valid? 
      @user.update_attributes(:online => true)
      sign_in @user
      redirect_to controller: :users, action: :show
    else
      session[:signin] = true
      redirect_to controller: :welcome, :action => :index
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
  
end
