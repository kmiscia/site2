class SiteController < ApplicationController
  require 'twitter/oauth'
  
  layout 'application'
  
  #before_filter :calculate_filter_mask
  
  def index
    @articles = Article.filter(session[:filter_mask], params)
    @categories = Category.all
  end

  def tweets
    render :text => Twitter::Oauth.call.body
  end
end
