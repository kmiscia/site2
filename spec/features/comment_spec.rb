require "rails_helper"

feature "Commenting on an article", :type => :feature, :js => true do

  before(:each) do
    snowboarding_category = Category.where(name: 'snowboard').first
    @snowboarding_article = create_article(category: snowboarding_category)
    
  end

  scenario "A user submits a comment" do
    visit("/")
    find(".article").click
    click_link("Show Comments (0)")
    page.fill_in 'comment_body', :with => 'Here is a test comment!'
    click_button("Post")
  end
end