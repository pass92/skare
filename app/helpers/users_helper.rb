module UsersHelper

  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.username, class: 'img-rounded', style: 'width:100px; heigth:100px')
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

end
