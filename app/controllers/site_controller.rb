class SiteController < ApplicationController
  
  layout 'application'
  
  require 'oauth'

  #before_filter :calculate_filter_mask
  
  def index
    @default_search_text = t("homepage.search_placeholder_text")
    @articles = Article.all #TODO - Article.filter(session, params)
    @categories = Category.all
  end

  def tweets
    render :text => twitter_oauth_access_token.request(:get, twitter_api_url).body
  end
  
  private
  
  def twitter_api_url
    URI::HTTPS.build(:host => SETTINGS["twitter_api_url"], :query => twitter_api_params.to_query).to_s
  end
  
  def twitter_api_params
    {
      slug: SETTINGS[:twitter_slug],
      owner_screen_name: SETTINGS[:twitter_owner_screen_name],
      per_page: SETTINGS[:twitter_per_page],
      page: SETTINGS[:twitter_page],
      include_entities: SETTINGS[:twitter_include_entities],
      include_rts: SETTINGS[:twitter_include_rts]
    }
  end
  
  def twitter_oauth_consumer
    OAuth::Consumer.new(Rails.application.secrets.twitter_consumer_key, Rails.application.secrets.twitter_consumer_secret, {
      :site => "http://api.twitter.com",
      :scheme => :header
    })
  end
  
  def twitter_oauth_access_token
    OAuth::AccessToken.from_hash(twitter_oauth_consumer, {
      :oauth_token => Rails.application.secrets.twitter_access_token,
      :oauth_token_secret => Rails.application.secrets.twitter_access_token_secret
    })
  end

end
