require "rails_helper"

feature "Custom content", :type => :feature, :js => true do

  scenario "A user visits a custom page" do
    
    create(:content, {
      name: "Custom Page",
      name_slug: "custom_page",
      body: "This is the custom page body"
    })
    
    visit("/page/custom_page")
    expect(page).to have_content("This is the custom page body")
  end
end