require 'rails_helper'

RSpec.describe ArticlesController do

  before(:each) do
    
    @category_one = create(:category)
    @article_one = create_article(category: @category_one)
    
    @category_two = create(:category)
    @article_two = create_article(category: @category_two)
    
    @category_three = create(:category)
    @article_three = create_article(category: @category_three)
    
    session[:filter_mask] = Category.default_filter_mask
  end
  
  describe "GET index" do

    it "assigns articles" do
      xhr :get, :index
      articles = assigns(:articles)
      expect(articles).to include(@article_one)
      expect(articles).to include(@article_two)
      expect(articles).to include(@article_three)
    end
    
    it "renders articles" do
      xhr :get, :index
      expect(response).to render_template(:partial => "_list")
    end
    
    it "assigns articles when removing ONE filter mask" do  
      expect(session[:filter_mask]).to eql(Category.default_filter_mask)
      xhr :get, :index, { filter_mask: @category_one.filter_mask }
      
      articles = assigns(:articles)
      expect(articles).to include(@article_two)
      expect(articles).to include(@article_three)
    end
    
    it "assigns articles when removing MULTIPLE filter masks" do  
      expect(session[:filter_mask]).to eql(Category.default_filter_mask)
      xhr :get, :index, { filter_mask: @category_one.filter_mask + @category_two.filter_mask }
      
      articles = assigns(:articles)
      expect(articles).to include(@article_three)
    end
    
    it "assigns articles when adding ONE filter mask" do  
      session[:filter_mask] = 0
      xhr :get, :index, { filter_mask: @category_one.filter_mask }
      
      articles = assigns(:articles)
      expect(articles).to include(@article_one)
    end
    
    it "assigns articles when adding MULTIPLE filter masks" do  
      session[:filter_mask] = 0
      xhr :get, :index, { filter_mask: @category_one.filter_mask + @category_two.filter_mask }
      
      articles = assigns(:articles)
      expect(articles).to include(@article_one)
      expect(articles).to include(@article_two)
    end
    
    it "redirects non-ajax requests to root" do
      get :index
      expect(response).to redirect_to("/")
    end
  end

end
