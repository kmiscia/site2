class GalleriesController < BaseController
  
  def index
    @galleries = Gallery.all.collect do |gallery|
      GalleryPresenter.new(gallery)
    end
  end
end
