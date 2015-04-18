require "rails_helper"

feature "Article Filters", :type => :feature, :js => true do
  
  before(:each) do
    @snowboarding_article = create(:snowboarding_article)
  end

end