require 'rails_helper'

RSpec.describe User, type: :model do
	describe 'Validations' do
	  # pending "add some examples to (or delete) #{__FILE__}"

	  # it "must have password_digest given matching passwords" do
	  # 	@user = User.new password_confirmation: "13", password: "13"
	  # 	@user.save
	  # 	expect(@user.password_digest).to be_present
	  # end

	  it "should fail if password and confirmation doesn't match" do
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

	  describe "#downcase_email" do
		  it "makes the email attribute lower case" do
	      user = User.new(email: "TEST@TEST.COM")
	      expect{ user.downcase_email }.to change{ user.email }.
	        from("TEST@TEST.COM").
	        to("test@test.com")
	    end

	    it "downcases an email before saving" do
	      user = User.new id: 2, firstname: "Peter", lastname: "syn", email: "TEST@TEST.COM", password_digest: "12345678", created_at: "123", updated_at: "2019-06-18 00:00:00"
	      p "USER", user
	      expect(user.save).to be true
	      expect(user.email).to eq("test@test.com")
	    end
	  end
	  

	  it "should have a longer password" do 
	  	@user = User.new password: '1234567'
	  	@user.save
	  	expect(@user.password).to be_present 
    end

    describe '.authenticate_with_credentials' do
    # examples for this class method here
  	end

	end
end
