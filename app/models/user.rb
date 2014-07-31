class User < ActiveRecord::Base
	validates :nombre, presence: true
end
