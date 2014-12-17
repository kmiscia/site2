require "rails_helper"

describe Gallery do

  before(:each) do
    @gallery = create(:gallery)
  end

  it { should validate_presence_of(:name) }

  it { should have_many(:gallery_images) }
  it { should accept_nested_attributes_for(:gallery_images) }
end
