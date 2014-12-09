require "rails_helper"

describe Content do

  before(:each) do
    @content = create(:content)
  end

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_uniqueness_of(:name_slug) }

  it "allows deletion of regular content" do
    assert @content.destroy
  end

  it "does not allow deletion of system content" do
    @content.system = true
    refute @content.destroy
  end
end
