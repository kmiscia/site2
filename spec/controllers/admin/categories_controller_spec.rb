require 'rails_helper'

RSpec.describe Admin::CategoriesController do

  before(:each) do
    sign_in FactoryGirl.create(:admin)
    @category = create(:category)
  end

  describe "GET index" do

    it "assigns and renders categories" do
      get :index

      expect(assigns(:categories)).to eq([@category])
      expect(response).to render_template("index")
    end
  end

  describe "GET edit" do

    it "assigns and renders category" do
      get :edit, :id => @category.id

      expect(assigns(:category)).to eq(@category)
      expect(response).to render_template("edit")
    end
  end

  describe "GET new" do

    it "assigns and renders category" do
      get :new

      assert(assigns(:category))
      assert(assigns(:category).new_record?)
      expect(response).to render_template("new")
    end
  end

  describe "POST create" do

    it "creates and renders categories" do
      Category.destroy_all
      expect{ post :create, :category => FactoryGirl.attributes_for(:category) }.to change{Category.count}.by(1)
      expect(response).to redirect_to(admin_categories_url)
    end

    it "warns when it cannot create category" do
      allow_any_instance_of(Category).to receive(:save).and_return(false)

      expect{ post :create, :category => FactoryGirl.attributes_for(:category) }.to change{Category.count}.by(0)
      expect(response).to render_template("new")
    end
  end

  describe "PATCH update" do

    it "updates and renders categories" do
      patch :update, { :id => @category.id, :category => { :name => "new name" }}
      assert_equal @category.reload.name, "new name"
      expect(response).to redirect_to(admin_categories_url)
    end

    it "warns when it cannot update category" do
      patch :update, { :id => @category.id, :category => { :name => "" }}
      refute_equal @category.reload.name, ""
      expect(response).to render_template("edit")
    end
  end

  describe "DELETE destroy" do

    it "destroys and renders categories" do
      expect{ delete :destroy, :id => @category.id }.to change{Category.count}.by(-1)
      expect(response).to redirect_to(admin_categories_url)
    end

    it "warns when it cannot destroy category" do
      allow_any_instance_of(Category).to receive(:destroy).and_return(false)

      expect{ delete :destroy, :id => @category.id }.to change{Category.count}.by(0)
      expect(response).to redirect_to(admin_categories_url)
    end
  end
end
