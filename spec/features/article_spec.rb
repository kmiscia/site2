require "rails_helper"

feature "Homepage article display", :type => :feature, :js => true do

  before(:each) do
    snowboarding_category = Category.where(name: 'snowboard').first
    @snowboarding_article = create_article(category: snowboarding_category)
    visit("/")
  end

  scenario "A user hovers over collapsed article" do
    expect(page).to have_selector('.label', visible: false)
    find(".article_wrapper").hover
    expect(page).to have_selector('.label', visible: true)
  end

  scenario "A user expands and collapses an article" do
    expect(page).to have_selector('.article_body', visible: false)
    find(".article_wrapper").click
    expect(page).to have_selector('.article_body', visible: true)
    find(".article_wrapper").click
    expect(page).to have_selector('.article_body', visible: false)
  end
end