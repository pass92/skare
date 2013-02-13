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
#

require 'spec_helper'

describe User do
  
  before {@user = User.new(:username => "Alex", email: "alex.pellegrini@live.com", :password => "mammamia", :password_confirmation => "mammamia")}

  subject{@user}
  
  it{should respond_to(:username)}
  it{should respond_to(:email)}
  it{should respond_to(:password_digest)}
  it{should respond_to(:authenticate)}
  it{should respond_to(:password)}
  it{should respond_to(:password_confirmation)}
  it{should be_valid}
  
  describe "email not match regex" do
    before {@user.email="stronzo"}
    it {should_not be_valid}
  end

  describe "presence of name" do
    before {@user.username = "  "}
    it{should_not be_valid}
  end

  describe "password do not match" do
    before {@user.password_confirmation = "culatte"}
    it {should_not be_valid}
  end

  describe "password not present" do
    before {@user.password = " "}
    it {should_not be_valid}
  end

  describe "passwords blank" do
    before { @user.password = @user.password_confirmation = " "}
    it {should_not be_valid}
  end
  
end
