class Admin::UsersController < AdminController

  layout 'admin'

  before_action :authenticate_user!

  before_filter :find_user, only: [:edit, :update, :destroy]
  before_filter :build_user, only: [:new, :create, :signup]

  def index
    @users = User.find(:all)
  end

  def edit; end
  def new; end

  def create
    if @user.save
      flash[:message] = "User #{@user.username} created successfully."
      redirect_to admin_users_url
    else
      flash[:message] = "An error occurred while saving the user."
      render :controller => :users, :action => :edit
    end
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:message] = "User #{@user.username} updated successfully."
      redirect_to admin_users_url
    else
      flash[:message] = "An error occurred while updating the user."
      render :controller => :users, :action => :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:message] = "User #{@user.username} removed successfully."
      redirect_to admin_users_url
    else
      flash[:message] = "An error occurred while deleting the user."
      render :controller => :users, :action => :index
    end
  end

  def signup
    if request.post?
      if @user.save
        session[:user] = User.authenticate(@user.username, @user.password)
        flash[:message] = "Signup successful"
        redirect_to :controller => :users, :action => :welcome
      else
        flash[:error] = "Signup unsuccessful"
      end
    end
  end

  def login
    if request.post?
      if session[:user] = User.authenticate(params[:user][:username], params[:user][:password])
        flash[:message] = "Login successful"
        redirect_to_stored
      else
        flash[:error] = "Login unsuccessful"
      end
    end
  end

  def logout
    session[:user] = nil
    flash[:message] = 'Logged out'
    redirect_to :action => 'login'
  end

  def forgot_password
    if request.post?
      user = User.find_by_email(params[:user][:email])
      if user and user.send_new_password
        flash[:message] = "A new password has been sent by email."
        redirect_to :action => 'login'
      else
        flash[:error] = "Couldn't send password"
      end
    end
  end

  def change_password
    @user = session[:user]
    if request.post?
      @user.update_attributes(:password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation])
      if @user.save
        flash[:message] = "Password Changed"
      end
    end
  end

  def welcome; end
  def hidden; end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def build_user
    @user = User.new(params[:user])
  end
end
