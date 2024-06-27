class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:query].present?
      @users = User.includes(:info_user).search_by_term(params[:query])
    else
      @users = User.includes(:info_user).all
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: t('.updated')
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

  def info_user_params
    params.require(:info_user).permit(:first_name, :last_name, :location, :province, :street, :number, :cell, :user_id)
  end
end
  
