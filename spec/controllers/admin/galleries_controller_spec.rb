require 'rails_helper'

RSpec.describe Admin::GalleriesController do

  before(:each) do
    sign_in FactoryGirl.create(:admin)
    @gallery = create(:gallery)
  end

  describe "GET index" do

    it "assigns and renders galleries" do
      get :index

      expect(assigns(:galleries)).to eq([@gallery])
      expect(response).to render_template("index")
    end
  end

  describe "GET edit" do

    it "assigns and renders gallery" do
      get :edit, :id => @gallery.id

      expect(assigns(:gallery)).to eq(@gallery)
      expect(response).to render_template("edit")
    end
  end

  describe "GET new" do

    it "assigns and renders category" do
      get :new

      assert(assigns(:gallery))
      assert(assigns(:gallery).new_record?)
      expect(response).to render_template("new")
    end
  end

  describe "POST create" do

    it "creates and renders categories" do
      expect{ post :create, :gallery => FactoryGirl.attributes_for(:gallery) }.to change{ Gallery.count }.by(1)
      expect(response).to redirect_to(admin_galleries_url)
    end

    it "warns when it cannot create gallery" do
      allow_any_instance_of(Gallery).to receive(:save).and_return(false)

      expect{ post :create, :gallery => FactoryGirl.attributes_for(:gallery) }.to change{ Gallery.count }.by(0)
      expect(response).to render_template("new")
    end
  end

  describe "PATCH update" do

    it "updates and renders gallery" do
      patch :update, { :id => @gallery.id, :gallery => { :name => "new name" }}
      assert_equal @gallery.reload.name, "new name"
      expect(response).to redirect_to(admin_galleries_url)
    end

    it "warns when it cannot update gallery" do
      patch :update, { :id => @gallery.id, :gallery => { :name => "" }}
      refute_equal @gallery.reload.name, ""
      expect(response).to render_template("edit")
    end
  end

  describe "DELETE destroy" do

    it "destroys and renders gallery" do
      expect{ delete :destroy, :id => @gallery.id }.to change{ Gallery.count }.by(-1)
      expect(response).to redirect_to(admin_galleries_url)
    end

    it "warns when it cannot destroy gallery" do
      allow_any_instance_of(Gallery).to receive(:destroy).and_return(false)

      expect{ delete :destroy, :id => @gallery.id }.to change{ Gallery.count }.by(0)
      expect(response).to redirect_to(admin_galleries_url)
    end
  end
end
