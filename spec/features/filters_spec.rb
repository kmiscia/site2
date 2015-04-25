require "rails_helper"

feature "Article Filters", :type => :feature, :js => true do
  
  before(:each) do
    snowboarding_category = Category.where(name: 'snowboard').first
    @snowboarding_article = create_article(category: snowboarding_category)
    
    running_category = Category.where(name: 'running').first
    @running_article = create_article(category: running_category)
    
    web_category = Category.where(name: 'web').first
    @web_article = create_article(category: web_category)
    
    # Visit the homepage and show all filters
    visit "/"
    click_link("Filters")
  end
  
  scenario "hides and shows articles" do
    
    # Should display all articles
    expect(page).to have_content(@snowboarding_article.title)
    expect(page).to have_content(@web_article.title)
    expect(page).to have_content(@running_article.title)
    
    # Clicking running filter hides running articles
    click_link("Running Filter")
    expect(page).to have_no_content(@running_article.title)
    expect(page).to have_content(@snowboarding_article.title)
    expect(page).to have_content(@web_article.title)
    
    # Clicking snowboard filter hides snowboard articles
    click_link("Snowboard Filter")
    expect(page).to have_no_content(@running_article.title)
    expect(page).to have_no_content(@snowboarding_article.title)
    expect(page).to have_content(@web_article.title)
    
    # Clicking running filter again shows running articles
    click_link("Running Filter")
    expect(page).to have_content(@running_article.title)
    expect(page).to have_no_content(@snowboarding_article.title)
    expect(page).to have_content(@web_article.title)
    
    # Clicking snowboard filter again shows snowboarding articles
    click_link("Snowboard Filter")
    expect(page).to have_content(@running_article.title)
    expect(page).to have_content(@snowboarding_article.title)
    expect(page).to have_content(@web_article.title)
  end
  
end