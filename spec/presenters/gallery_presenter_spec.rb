require "rails_helper"

describe GalleryPresenter do

  before(:each) do
    @gallery = create(:gallery)
    @gallery.gallery_images << create(:gallery_image)
    @presenter = GalleryPresenter.new(@gallery)
  end
  
  describe "#gallery_images" do
    it "returns a collection of gallery image presenters" do
      expect(@presenter.gallery_images.first).to be_a(GalleryImagePresenter)
    end
  end
end