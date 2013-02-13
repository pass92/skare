require 'spec_helper'

describe User do
  
  before {@user = User.new(:username => "Alex", email: "alex.pellegrini@live.com")}

  subject{@user}
  
  it{should respond_to(:username)}
  it{should respond_to(:email)}
  it{should be_valid}

  describe "email not match regex" do
    before {@user.email="stronzo"}
    it {should_not be_valid}
  end

  describe "presence of name" do
    before {@user.username = "  "}
    it{should_not be_valid}
  end
  
end
