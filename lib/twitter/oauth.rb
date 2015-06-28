module Twitter
  class Oauth
    class << self
    
      def body
        call.body
      end
    
      private
      
      def call
        twitter_oauth_access_token.request(:get, twitter_api_url)
      end
      
      def twitter_api_url
        URI::HTTPS.build({
          host: SETTINGS[:twitter][:api_host], 
          path: SETTINGS[:twitter][:api_path], 
          query: twitter_api_params.to_query
        }).to_s
      end
      
      def twitter_api_params
        {
          slug: SETTINGS[:twitter][:slug],
          owner_screen_name: SETTINGS[:twitter][:owner_screen_name],
          per_page: SETTINGS[:twitter][:per_page],
          page: SETTINGS[:twitter][:page],
          include_entities: SETTINGS[:twitter][:include_entities],
          include_rts: SETTINGS[:twitter][:include_rts]
        }
      end
      
      def twitter_oauth_consumer
        OAuth::Consumer.new(Rails.application.secrets.twitter["consumer_key"], Rails.application.secrets.twitter["consumer_secret"], {
          :site => URI::HTTP.build(host: SETTINGS[:twitter][:api_host]),
          :scheme => :header
        })
      end
      
      def twitter_oauth_access_token
        OAuth::AccessToken.from_hash(twitter_oauth_consumer, {
          :oauth_token => Rails.application.secrets.twitter["access_token"],
          :oauth_token_secret => Rails.application.secrets.twitter["access_token_secret"]
        })
      end
    
    end
  end
end