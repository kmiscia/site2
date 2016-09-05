class CommentSerializer < ApplicationSerializer
  self.root = false

  attributes :id,
    :body,
    :created_at
  
  has_one :user
  
  def homepage_image_url
    object.photo.url(:cropped, timestamp: false)
  end
  
  def created_at
    time_format(object.created_at)
  end
end