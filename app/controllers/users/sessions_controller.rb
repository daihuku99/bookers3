# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  # #   super
  # end

  # POST /resource/sign_in
  # def create
  # #   super
  #   user = user.find_by(name: params[:name].downcase)
  #   if user && user.authenticate(params[:password])
  #     log_in user
  #     flash[:notice] = "Signed in successfully."
  #     redirect_to user_path(current_user.id)
  #   else
  #     redirect_to new_user_session_path
  #   end
  # end

  # DELETE /resource/sign_out
  # def destroy
  # #   super
  #   session.delete(:user_id)
  #   @current_user = nil
  #   flash[:notice] = "Signed out successfully"
  #   redirect_to :root
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
