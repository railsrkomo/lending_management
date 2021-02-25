class User < ApplicationRecord
	has_many :lendings, foreign_key: "lender_id"
	has_many :borrowings, foreign_key: "borrower_id"
	has_many :fellows
	has_many :friends, through: :fellows, foreign_key:  "friend_id"

	before_validation { email.downcase! }
	has_secure_password
	# has_secure_password :recovery_password, validations: false
  # attr_accessor :password_digest, :recovery_password_digest
	validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
	
end
