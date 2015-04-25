require 'rails_helper'

RSpec.describe SiteController do

  before(:each) do
    @article = create_article
  end

  describe "GET index" do
    it "assigns and renders articles" do
      get :index
      assert_equal assigns(:articles).map(&:id), [@article.id]
    end
  end
  
  describe "GET tweets" do
    it "attempts to retrive tweets" do
      expect(Twitter::Oauth).to receive(:body)
      get :tweets
      expect(response).to have_http_status(:ok)
    end
  end
end
