class GalleryImagesController < BaseController
  def show
    @gallery_image = GalleryImage.find(params[:id])
  end
end