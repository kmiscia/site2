require "rails_helper"

describe Gallery do
  it { should have_many(:gallery_images) }
  it { should validate_presence_of(:name) }
  it { should accept_nested_attributes_for(:gallery_images) }
end