require 'rails_helper'

RSpec.describe GalleriesController do

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

end
