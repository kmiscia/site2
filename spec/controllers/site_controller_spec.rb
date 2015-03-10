require 'rails_helper'

RSpec.describe SiteController do

  before(:each) do
    @article = create(:article)
  end

  describe "GET index" do
    it "assigns and renders articles" do
      get :index
      assert_equal assigns(:articles).map(&:id), [@article.id]
    end
  end
end
