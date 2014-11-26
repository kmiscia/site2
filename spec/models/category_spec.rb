require "rails_helper"

describe Category do

  before(:each) do
    @category = create(:category)
  end

  it { should have_many(:articles) }
  it { should validate_presence_of(:name) }
end
