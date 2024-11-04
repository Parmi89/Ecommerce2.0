class User::InfoUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_info_user, only: [:show, :edit, :update]

  # GET /users/info_user
  def show
  end

  # GET /users/info_user/edit
  def edit
  end

  # PATCH /users/info_user
  def update
    if @info_user.update(info_user_params)
      redirect_to user_info_user_path(current_user), notice: t('.updated')
    else
      render :edit
    end
  end

  private

  def set_info_user
    @info_user = current_user.info_user || current_user.build_info_user
  end

  def info_user_params
    params.require(:info_user).permit(:first_name, :last_name, :location, :province, :street, :number, :cell, :user_id)
  end
end

