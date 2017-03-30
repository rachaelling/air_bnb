class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @reservations = current_user.reservations 
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Profile Updated!"
      redirect_to root_path
    else
      flash[:error] = "Error in updating profile"
      render "users/edit"
    end
  end

  def destroy
   @user = User.find(params[:id])
   @user.destroy
   redirect_to root_path
  end


  private
  def user_params
      params.require(:user).permit(:email, :password, :image)
  end

end
