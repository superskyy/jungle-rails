require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "must have password_digest given matching passwords" do
  	@user = User.new password_confirmation: "13", password: "13"
  	@user.save
  	expect(@user.password_digest).to be_present
  end

  it "should fail is password and confirmation doesn't match" do
  	@user = User.new password_confirmation: "123", password: "13"
  	@user.save
  	expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it "should fail without a password" do
  	@user = User.new password_confirmation: "13"
  	@user.save
  	expect(@user.errors[:password]).to include("can't be blank")
  	expect(@user.password_digest).to_not be_present
  end



end
