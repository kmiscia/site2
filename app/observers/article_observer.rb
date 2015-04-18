=begin

  Whenever creating articles in specs, getting non-deterministic failures 
  b/c articles are not making it into the delta index in time. Current hack 
  is to force sleep for 3 seconds after creating any articles needed in index.
  
  https://github.com/kmiscia/site2/issues/13
=end
class ArticleObserver < ActiveRecord::Observer
  def after_create(article)
    sleep(3)
  end
end