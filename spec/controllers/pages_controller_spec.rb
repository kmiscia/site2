require 'rails_helper'

RSpec.describe PagesController do

  before(:each) do
    @contents = create(:content)
  end

  describe "GET show" do
    it "assigns and renders contents" do
      get :show, { name_slug: @contents.name_slug }
      assert_equal assigns(:contents), [@contents]
    end
  end
end
