=begin

  Whenever creating articles in specs, getting non-deterministic failures 
  b/c articles are not making it into the delta index in time. Current hack 
  is to use these methods to create article fixtures instead of factorygirl.
  
  https://github.com/kmiscia/site2/issues/13
=end
module ArticleSphinxHelper
  
  def create_article(attributes = {})
    article = create(:article, attributes)
    index if article.valid?
    article
  end
  
  def update_article(article, attributes = {})
    article.update_attributes(attributes) if attributes.present?
    index if article.valid?
    article
  end
  
  def save_article(article)
    article = article.save
    index if article.valid?
    article
  end
end

RSpec.configure do |config|
  config.include ArticleSphinxHelper
end