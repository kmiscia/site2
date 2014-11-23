class Admin::Users::RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    byebug
    params.require(:admin_user).permit(:username, :email, :password, :password_confirmation)
  end
end
