require 'digest/sha2'

class User < ActiveRecord::Base
	validates :nombre, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates :password, presence: true, :confirmation => true

	attr_accessor :password_confirmation
	attr_reader :password

	validate :password_must_be_present

	def password=(password)
		@password = password

		if password.present?
			generate_salt
			self.hashed_password = self.class.encrypt_password(password, salt)
		end
	end

	class << self
		def authenticate(nombre, password)
			if user = find_by_nombre(nombre)
				if user.hashed_password == encrypt_password(password, user.salt)
					return user
				end
			end
		end

		def encrypt_password(password, salt)
			Digest::SHA2.hexdigest(password + "wibble" + salt)
		end
	end

	private
		def password_must_be_present
			errors.add(:password, "no puede estar en blanco" ) unless hashed_password.present?
		end

		def encrypt_password(password, salt)
			Digest::SHA2.hexdigest(password + "wibble" + salt)
		end

		def generate_salt
			self.salt = self.object_id.to_s + rand.to_s
		end
end
