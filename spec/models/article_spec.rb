require "rails_helper"

describe Article do

  before(:each) do
    @article = create(:article)
  end

  it { should have_many(:comments) }
end
