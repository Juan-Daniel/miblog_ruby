class UsersController < ApplicationController
  def index
  	@usuarios=User.all
  end

  def new
  	@usuarios=User.new
  end

  def create
  	@usuario=User.new(user_params)

  	@usuario.save
  	redirect_to users_path
  end

  private
	  def user_params
	    params.require(:user).permit(:nombre, :email)
	  end
end
