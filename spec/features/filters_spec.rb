require "rails_helper"

feature "Article Filters", :type => :feature, :js => true do
  
  before(:each) do
    @snowboarding_article = create(:snowboarding_article)
    sleep(3) # https://github.com/kmiscia/site2/issues/13
  end

  scenario "Clicks a filter" do
    visit "/"
    byebug
    page.find("#filter_heading").trigger("click")
    save_and_open_page
  end
end