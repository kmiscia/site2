require "rails_helper"

describe Twitter::Oauth do

  describe ".body" do
    let(:response) { JSON.parse(Twitter::Oauth.body) }
    
    it "returns a tweet" do
      expect(response.first["text"]).not_to be_empty
    end
  end

  # NOTE: Testing private methods here basically as practice and to 
  # explore the rpsec API. These are neither good tests or should 
  # even really exist.

  describe ".call" do
    it "makes a request with the access token" do
      expect_any_instance_of(OAuth::AccessToken).to receive(:request).with(:get, Twitter::Oauth.send(:twitter_api_url))
      Twitter::Oauth.send(:call)
    end
  end

  describe ".twitter_api_url" do
    it "builds the API url" do
      expect(Twitter::Oauth.send(:twitter_api_url)).to match(/^https:\/\/#{SETTINGS[:twitter][:api_host]}/)
    end
  end

  describe ".twitter_api_params" do
    it "builds the API params" do
      expect(Twitter::Oauth.send(:twitter_api_params)).to eq({
        slug: "miscianet", 
        owner_screen_name: "misch331",
        per_page: 200, 
        page: 1,
        include_entities: false, 
        include_rts: false
      })
    end
  end
  
  describe ".twitter_oauth_consumer" do
    
    let(:oauth_consumer) { Twitter::Oauth.send(:twitter_oauth_consumer) }
    
    it "is for the API site" do
      expect(oauth_consumer.site).to eq("http://#{SETTINGS[:twitter][:api_host]}") 
    end
    
    it "uses the secret key" do
      expect(oauth_consumer.key).to eq(Rails.application.secrets.twitter_consumer_key) 
    end
    
    it "uses the consumer key" do
      expect(oauth_consumer.secret).to eq(Rails.application.secrets.twitter_consumer_secret) 
    end
  end
  
  describe ".twitter_oauth_access_token" do
    
    let(:oauth_token) { Twitter::Oauth.send(:twitter_oauth_access_token) }
    
    it "uses the oauth token" do
      expect(oauth_token.token).to eq(Rails.application.secrets.twitter_access_token) 
    end
    
    it "uses the oauth secret" do
      expect(oauth_token.secret).to eq(Rails.application.secrets.twitter_access_token_secret) 
    end
  end

end