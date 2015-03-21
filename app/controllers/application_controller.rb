class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def calculate_filter_mask
    return session[:filter_mask] unless params[:filter_mask]
    
    byebug
    
    session[:filter_mask] ||= default_filter_mask
    if session[:filter_mask].to_i & params[:filter_mask].to_i == params[:filter_mask].to_i
      session[:filter_mask] -= params[:filter_mask].to_i
    else
      session[:filter_mask] += params[:filter_mask].to_i
    end
  end
  
  private
  
  # The default filter mask if to show all categories, which
  # means the mask is the sum of all their IDS
  def default_filter_mask
    Category.all.map(&:id).sum
  end
  
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    admin_root_path
  end
end
