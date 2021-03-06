require 'delegate'
 
class GalleryPresenter < SimpleDelegator
  
  def gallery_images
    __getobj__.gallery_images.shuffle.map do |gallery_image|
      GalleryImagePresenter.new(gallery_image)
    end
  end

end