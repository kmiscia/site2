require 'rails_helper'

RSpec.describe Admin::UsersController do
  
  before(:each) do
    @user = create(:user)
    @admin = create(:admin)
    sign_in @admin
  end
  
  describe "GET index" do
    
    it "assigns and renders categories" do
      get :index
      
      expect(assigns(:users)).to eq([@user, @admin])
      expect(response).to render_template("index")
    end
  end
  
  describe "DELETE destroy" do
    
    it "destroys and renders users" do
      expect{ delete :destroy, :id => @user.id }.to change{ User.count }.by(-1)
    end
    
    it "destroys current user and logs out" do
      expect{ delete :destroy, :id => @admin.id }.to change{User.count}.by(-1)
    end
    
    it "warns when it cannot destroy user" do
      allow_any_instance_of(User).to receive(:destroy).and_return(false)
      
      expect{ delete :destroy, :id => @user.id }.to change{ User.count }.by(0)
      expect(response).to redirect_to(admin_users_url)
    end
  end
end
