require "rails_helper"

describe GalleryImage do

  before(:each) do
    @gallery_image = create(:gallery_image)
  end

  it { should belong_to(:gallery) }
  it { should have_attached_file(:photo) }
  it { should validate_attachment_content_type(:photo).allowing("image/jpg", "image/jpeg", "image/png", "image/gif") }
  it { should validate_attachment_size(:photo).less_than(10.megabytes) }
  
  it "defines styles" do
    assert GalleryImage::STYLES.is_a?(Hash)
  end
  
  it "does not have styles for new gallery images" do
    @gallery_image = build(:gallery_image)
    GalleryImage::STYLES.all? do |style, dimensions|
      @gallery_image.photo.exists?(style)
    end
  end
  
  it "has a photo for each style on save" do
    # TODO - How to test now that we're delegating to resque
  end
end
