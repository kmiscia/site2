require 'rails_helper'

RSpec.describe ArticlesController do

  before(:each) do
    @article = create(:article)
    sleep(3)
  end
  
  describe "GET index" do

    it "assigns and renders articles" do
      xhr :get, :index

      expect(assigns(:articles).map(&:id)).to eq([@article.id])
      expect(response).to render_template(:partial => "_list")
    end
    
    it "redirects non-ajax requests to root" do
      get :index
      expect(response).to redirect_to("/")
    end
  end

end
