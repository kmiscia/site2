class ArticleSerializer < ApplicationSerializer
  self.root = false

  attributes :id,
    :title,
    :homepage_image_url,
    :category,
    :posted_at,
    :body,
    :url,
    :user,
    :category,
    :comments
  
  def homepage_image_url
    object.photo.url(:cropped, timestamp: false)
  end
  
  def posted_at
    time_format(object.posted_at)
  end
end