# app/controllers/users_controller.rb
class User::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @info_user = current_user.info_user
  end

  def edit
    @info_user = current_user.info_user || current_user.build_info_user
  end

  def update
    @info_user = current_user.info_user || current_user.build_info_user
    if @info_user.update(info_user_params)
      redirect_to root_path, notice: 'Información actualizada correctamente.'
    else
      render :edit
    end
  end

  private

  def info_user_params
    params.require(:info_user).permit(:first_name, :last_name)
  end
end
