class UsersController < ApplicationController
  def index
  	@usuarios=User.all
  end

  def new
  	@usuario=User.new
  end

  def create
  	@usuario=User.new(user_params)

  	if @usuario.save
  		redirect_to users_path
  	else
  		render 'new'
  	end
  end

  def edit
  	@usuario=User.find(params[:id])
  end


  def update
  	@usuario=User.find(params[:id])

  	if @usuario.update(user_params)
  		redirect_to users_path
  	else
  		render 'edit'
  	end

  end


  def destroy
  	@usuario=User.find(params[:id])

  	@usuario.destroy

  	redirect_to users_path
  end


  def show
  	@usuario=User.find(params[:id])
  end


  private
	  def user_params
	    params.require(:usuario).permit(:nombre, :email, :password, :password_confirmation)
	  end
end
