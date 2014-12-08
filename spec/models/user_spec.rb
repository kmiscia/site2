=begin
require "rails_helper"

describe User do

  before(:each) do
    @user = create(:user)
  end

  it { should have_many(:articles).with_foreign_key('posted_by') }
  it { should have_many(:comments) }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should allow_value('test@miscia.net').for(:email) }

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should ensure_length_of(:username).is_at_least(3).is_at_most(40) }

  it { should validate_confirmation_of(:password) }
  it { should ensure_length_of(:password).is_at_least(8).is_at_most(128) }
  it { should validate_presence_of(:encrypted_password) }

end
=end
