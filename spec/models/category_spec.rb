require "rails_helper"

describe Category do

  before(:each) do
    create(:category)
    create(:category)
    create(:category)
  end

  it { should have_many(:articles) }
  it { should validate_presence_of(:name) }
  
  describe ".default_filter_mask" do
    it "returns the sum of all category filter masks" do
      expect(Category.default_filter_mask).to eql(7)
    end
  end
end
