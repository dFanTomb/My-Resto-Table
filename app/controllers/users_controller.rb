class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to new_user_registration,  status: :see_other
  end

  private

  def user_params
    params.require(:users).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar)
  end
end
