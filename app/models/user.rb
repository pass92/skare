class User < ActiveRecord::Base
  attr_accessible :email, :username

  before_save {|user| user.email = email.downcase}
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, uniqueness: true, presence: true, format: {with: VALID_EMAIL_REGEX}
  validates :username, presence: true
  
end
