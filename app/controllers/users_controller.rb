class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    byebug
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
