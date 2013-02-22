# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  online          :integer
#

class User < ActiveRecord::Base
  attr_accessible :email, :username, :password, :password_confirmation, :online
  has_secure_password
  has_many :posts

  before_create {|user| user.email = email.downcase}
  before_create :create_user_token
  
  #email regular expression
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, uniqueness: {case_sensitive: false}, presence: true, format: {with: VALID_EMAIL_REGEX}
  validates :username, presence: true
  validates :password, presence: true, length: {minimum: 6}
  validates_presence_of :password_confirmation

  def is_online?
    self.online
  end
  
  private
  #methods and variables declared after private won't be seen by outside users 
  def create_user_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
