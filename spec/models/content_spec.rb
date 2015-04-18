require "rails_helper"

describe Content do

  before(:each) { @content = create(:content) }
  
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_uniqueness_of(:name_slug) }

  describe '#destroy' do
    
    it "allows deletion of regular content" do
      assert @content.destroy
    end

    it "does not allow deletion of system content" do
      @content.system = true
      refute @content.destroy
    end
  end

end
