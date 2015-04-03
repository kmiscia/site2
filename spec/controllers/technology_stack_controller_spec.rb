require 'rails_helper'

RSpec.describe TechnologyStackController do

  describe "GET index" do
    it "assigns and renders screenshots" do
      get :index
      expect(assigns(:screenshots))
      expect(response).to render_template("index")
    end
  end
end
