class User < ActiveRecord::Base
	has_secure_password

	validates :password, length: { within: 6..40 }
end
