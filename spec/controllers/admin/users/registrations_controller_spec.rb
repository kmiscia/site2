require 'rails_helper'

RSpec.describe Admin::Users::RegistrationsController do

  include Devise::TestHelpers

  before(:each) do
    request.env['devise.mapping'] = Devise.mappings[:admin_user]
  end

  describe "POST create" do

    it "should create a user" do

      expect {
        post :create, :admin_user => {
          :username => "testuser",
          :email => "testuser@miscia.net",
          :password => "password",
          :password_confirmation => "password"
        }
      }.to change{User.count}.by(1)

      expect(response).to redirect_to("/")
    end
  end

end
