class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  
  protected
  
  def require_xhr
    unless request.xhr?
      redirect_to :root
      false
    end
  end
  
  private
  
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    admin_root_path
  end
end
