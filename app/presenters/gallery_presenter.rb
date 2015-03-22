require 'delegate'
 
class GalleryPresenter < SimpleDelegator
  
  def gallery_images
    model.gallery_images.map do |gallery_image|
      GalleryImagePresenter.new(gallery_image)
    end
  end
  
  def model
    __getobj__
  end
end