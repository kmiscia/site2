class Admin::UsersController < Admin::BaseController
  
  def index
    @users = User.all
  end
  
  def destroy
    if User.destroy(params[:id])
      flash[:success] = "User deleted successfully."
    else
      flash[:danger] = "An error occurred while deleting the user."
    end
    redirect_to admin_users_path
  end
end