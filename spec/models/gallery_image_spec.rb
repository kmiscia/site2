require "rails_helper"

describe GalleryImage do
  
  it { should belong_to(:gallery) }
  it { should have_attached_file(:photo) }
  it { should validate_attachment_content_type(:photo).allowing("image/jpg", "image/jpeg", "image/png", "image/gif") }
  it { should validate_attachment_size(:photo).less_than(10.megabytes) }
  
  describe ".STYLES" do 
    it "defines styles" do
      expect(GalleryImage.photo_styles).to be_a(Hash)
    end
  end
end
