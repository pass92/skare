module SessionsHelper
  
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token    
    self.current_user = user
    @current_user.update_attributes(:online => true)
    @@psw = user.password
  end
  
  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def sign_out
    @user = current_user
    @user.password=@user.password_confirmation = @@psw
    @user.update_attributes(:online => false)
    self.current_user=nil
    cookies.delete(:remember_token)
  end

end
