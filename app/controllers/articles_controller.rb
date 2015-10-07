class ArticlesController < ApplicationController

  layout 'application', :except => :index

  respond_to :html, :json

  before_filter :calculate_filter_mask, :only => :index
  #before_filter :require_xhr, :only => :index

  def index
    
    @articles = Article.filter({
      search_text: params[:search_text],
      filter_mask: session[:filter_mask],
      page: params[:page]
    })

    respond_with @articles
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  private
  
  def calculate_filter_mask
    return session[:filter_mask] unless params[:filter_mask]
    
    session[:filter_mask] ||= Category.default_filter_mask
    if session[:filter_mask].to_i & params[:filter_mask].to_i == params[:filter_mask].to_i
      session[:filter_mask] -= params[:filter_mask].to_i
    else
      session[:filter_mask] += params[:filter_mask].to_i
    end
  end
  
  
end