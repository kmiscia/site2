require 'rails_helper'

RSpec.describe Admin::Users::SessionsController do

  include Devise::TestHelpers

  before(:each) do
    request.env['devise.mapping'] = Devise.mappings[:admin_user]
    @admin = FactoryGirl.create(:admin) 
    sign_in @admin
  end

  describe "DELETE destroy" do

    subject { delete :destroy }

    it "logout a user" do
      expect(subject).to redirect_to("/admin")
    end
  end

end
