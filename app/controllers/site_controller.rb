class SiteController < ApplicationController
  require 'twitter/oauth'
  
  layout 'application'
  
  before_filter :calculate_filter_mask
  
  def index
    @articles = Article.filter({
      filter_mask: session[:filter_mask],
      search_text: params[:search_text],
      page: params[:page]
    })
    @categories = Category.all
  end

  def tweets
    render :text => Twitter::Oauth.body
  end
  
  
end
