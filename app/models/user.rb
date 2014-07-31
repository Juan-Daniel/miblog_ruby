class User < ActiveRecord::Base
	validates :nombre, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
end
