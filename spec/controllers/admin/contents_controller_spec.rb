require 'rails_helper'

RSpec.describe Admin::ContentsController do

  before(:each) do
    sign_in FactoryGirl.create(:admin)
    @content = create(:content)
  end

  describe "GET index" do

    it "assigns and renders contents" do
      get :index

      expect(assigns(:contents)).to eq([@content])
      expect(response).to render_template("index")
    end
  end

  describe "GET edit" do

    it "assigns and renders content" do
      get :edit, :id => @content.id

      expect(assigns(:content)).to eq(@content)
      expect(response).to render_template("edit")
    end
  end

  describe "GET new" do

    it "assigns and renders content" do
      get :new

      assert(assigns(:content))
      assert(assigns(:content).new_record?)
      expect(response).to render_template("new")
    end
  end

  describe "POST create" do

    it "creates and renders contents" do
      @content.destroy
      expect{ post :create, :content => FactoryGirl.attributes_for(:content) }.to change{Content.count}.by(1)
      expect(response).to redirect_to(admin_contents_url)
    end

    it "warns when it cannot create content" do
      allow_any_instance_of(Content).to receive(:save).and_return(false)

      expect{ post :create, :content => FactoryGirl.attributes_for(:content) }.to change{Content.count}.by(0)
      expect(response).to render_template("new")
    end
  end

  describe "PATCH update" do

    it "updates and renders contents" do
      patch :update, { :id => @content.id, :content => { :name => "new name" }}
      assert_equal @content.reload.name, "new name"
      expect(response).to redirect_to(admin_contents_url)
    end

    it "warns when it cannot update content" do
      patch :update, { :id => @content.id, :content => { :name => "" }}
      refute_equal @content.reload.name, ""
      expect(response).to render_template("edit")
    end
  end

  describe "DELETE destroy" do

    it "destroys and renders contents" do
      expect{ delete :destroy, :id => @content.id }.to change{Content.count}.by(-1)
      expect(response).to redirect_to(admin_contents_url)
    end

    it "warns when it cannot destroy content" do
      allow_any_instance_of(Content).to receive(:destroy).and_return(false)

      expect{ delete :destroy, :id => @content.id }.to change{Content.count}.by(0)
      expect(response).to redirect_to(admin_contents_url)
    end
  end
end
