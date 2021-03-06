=begin
require 'rails_helper'

feature "Homepage", :type => :feature, :js => true do
  
  context "with multiple articles" do
    before(:each) do
      
      snowboarding_category = Category.where(name: 'snowboard').first
      @snowboarding_article = create_article(title: 'Snowboarding Article', category: snowboarding_category, created_at: Time.now - 4)
      
      running_category = Category.where(name: 'running').first
      @running_article = create_article(title: 'Running Article', category: running_category, created_at: Time.now - 3)
      
      web_category = Category.where(name: 'web').first
      @web_article = create_article(title: 'Web Article', category: web_category, created_at: Time.now - 2)
      
      assorted_category = Category.where(name: 'assorted').first
      @assorted_article = create_article(title: 'Assorted Article', category: assorted_category, created_at: Time.now - 1)
    end

    scenario "user visits homepage" do
      visit "/"
      expect(page).to have_content(@snowboarding_article.title)
      expect(page).to have_content(@web_article.title)
      expect(page).to have_content(@assorted_article.title)
      expect(page).to have_content(@running_article.title)
    end 

    context "with two articles per page" do
      before(:each) do
        stub_const("SETTINGS", { articles_per_page: 2 })
      end
      
      scenario "user visits homepage" do
        visit "/"
        expect(page).to have_content(@web_article.title)
        expect(page).to have_content(@assorted_article.title)
        expect(page).to have_no_content(@snowboarding_article.title)
        expect(page).to have_no_content(@running_article.title)
        
        find('#page_2').click
        expect(page).to have_no_content(@web_article.title)
        expect(page).to have_no_content(@assorted_article.title)
        expect(page).to have_content(@snowboarding_article.title)
        expect(page).to have_content(@running_article.title)
      end
    end  
  end
end
=end