require 'rails_helper'

RSpec.describe Admin::ArticlesController do

  before(:each) do
    sign_in FactoryGirl.create(:admin)
    @article = create(:article)
  end

  describe "GET index" do

    it "assigns and renders articles" do
      get :index

      expect(assigns(:articles)).to eq([@article])
      expect(response).to render_template("index")
    end
  end

  describe "GET edit" do

    it "assigns and renders article" do
      get :edit, :id => @article.id

      expect(assigns(:article)).to eq(@article)
      expect(response).to render_template("edit")
    end
  end

  describe "GET new" do

    it "assigns and renders article" do
      get :new

      assert(assigns(:article))
      expect(assigns(:article)).to be_a_new(Article)
      expect(response).to render_template("new")
    end
  end

  describe "POST create" do

    it "creates and renders articles" do
      @article.destroy
      expect{ post :create, :article => FactoryGirl.attributes_for(:article) }.to change{Article.count}.by(1)
      expect(response).to redirect_to(admin_articles_url)
    end

    it "warns when it cannot create article" do
      allow_any_instance_of(Article).to receive(:save_and_process).and_return(false)

      expect{ post :create, :article => FactoryGirl.attributes_for(:article) }.to change{Article.count}.by(0)
      expect(response).to render_template("new")
    end
  end

  describe "PATCH update" do

    it "updates and renders articles" do
      patch :update, { :id => @article.id, :article => { :title => "new title" }}
      assert_equal @article.reload.title, "new title"
      expect(response).to redirect_to(admin_articles_url)
    end

    it "warns when it cannot update article" do
      patch :update, { :id => @article.id, :article => { :title => "" }}
      refute_equal @article.reload.title, ""
      expect(response).to render_template("edit")
    end
  end

  describe "DELETE destroy" do

    it "destroys and renders articles" do
      expect{ delete :destroy, :id => @article.id }.to change{Article.count}.by(-1)
      expect(response).to redirect_to(admin_articles_url)
    end

    it "warns when it cannot destroy article" do
      allow_any_instance_of(Article).to receive(:destroy).and_return(false)

      expect{ delete :destroy, :id => @article.id }.to change{Article.count}.by(0)
      expect(response).to redirect_to(admin_articles_url)
    end
  end
end
