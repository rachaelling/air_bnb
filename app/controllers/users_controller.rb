class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "Profile Updated!"
      redirect_to root_path
    else
      flash[:error] = "Error in updating profile"
      render "users/edit"
    end
  end

  def destroy
   @user = current_user
   @user.destroy
   redirect_to root_path
  end


  private
  def user_params
      params.require(:user).permit(:email, :password, :image)
  end

end
