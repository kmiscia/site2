require 'twitter/oauth'

class SiteController < BaseController
  
  def index
    @articles = Article.filter( filter_mask: session[:filter_mask] )
    @categories = Category.all
  end

  def tweets
    render :text => Twitter::Oauth.body
  end
end
