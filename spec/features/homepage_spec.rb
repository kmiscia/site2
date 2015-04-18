require 'rails_helper'

RSpec.describe "The homepage", :type => :feature do
  
  before(:each) do
    @article = create(:article)
  end
  
  it "displays articles" do
    visit "/"
    assert page.has_css?(".article")
  end
end