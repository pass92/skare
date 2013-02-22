module UsersHelper

  def gravatar_for(user, dim)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.username, class: 'img-rounded', style: 'width:'+dim.to_s+'px; heigth:'+dim.to_s+'px')
  end
end
