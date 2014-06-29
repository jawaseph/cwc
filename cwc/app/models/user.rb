class User < ActiveRecord::Base
	before_save { self.email = email.downcase }

	validates :zipcode, presence: true
	validates :gender, presence: true
	validates :lookingfor, presence: true
	validates :age, presence: true
	validates :name,  presence: true, length: { maximum: 50 }
 	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_senstive: false}
end
