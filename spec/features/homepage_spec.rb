require 'rails_helper'

RSpec.describe "The homepage", :type => :feature do
  
  before(:each) do
    @article = create(:article)
    sleep(3) # https://github.com/kmiscia/site2/issues/13
  end
  
  it "displays articles" do
    visit "/"
    assert page.has_css?(".article")
  end
end