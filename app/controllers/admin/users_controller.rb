class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: t('.created')
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to edit_admin_user_path, notice: t('.destroyed'), status: :see_other
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :username,:password)
  end
end
  
