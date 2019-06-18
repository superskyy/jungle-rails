class User < ActiveRecord::Base

	has_secure_password
	 # validates :password, length: {minimum: 8} 
	validates :email, presence: true, uniqueness: true
						      

	# validate_uniqueness_of :email
	 before_save :downcase_email

	def downcase_email
  	self.email = email.downcase
  end

  def authenticate_with_credentials (email, password)
   	self.email = email
   	self.password = password
  end
	 
end

