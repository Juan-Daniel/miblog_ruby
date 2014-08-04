class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy, :show]

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
  	
  end


  def update

  	if @usuario.update(user_params)
  		redirect_to users_path
  	else
  		render 'edit'
  	end

  end


  def destroy

  	@usuario.destroy

  	redirect_to users_path
  end


  def show
  	
  end


  private
    def set_user
      @usuario=User.find(params[:id])
    end

	  def user_params
	    params.require(:usuario).permit(:nombre, :email, :password, :password_confirmation)
	  end
end
