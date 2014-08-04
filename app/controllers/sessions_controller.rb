class SessionsController < ApplicationController

	def create
		usuario=User.find_by_nombre(params[:nombre])

		if user and usuario.authenticate(params[:password])
			session[:user_id]=user.id
			redirect_to user_path(user)
		end
	end

	def destroy
	end

end

