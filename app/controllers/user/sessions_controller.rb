# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  def destroy
    respond_to do |format|
      format.html { redirect_to products_path, notice: "User was successfully destroyed." }
    end
  end

  private
   def user_params
    params.require(:user).permit(:email, :username, :password)
  end

end
