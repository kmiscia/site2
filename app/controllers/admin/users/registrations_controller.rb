class Admin::Users::RegistrationsController < Devise::RegistrationsController

  layout nil

  private

  def sign_up_params
    params.require(:admin_user).permit(:username, :email, :password, :password_confirmation)
  end
end
