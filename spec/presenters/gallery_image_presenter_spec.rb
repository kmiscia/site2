require "rails_helper"

describe GalleryImagePresenter do

  before(:each) do
    @gallery_image = create(:gallery_image)
    @gallery_image.annotations << create(:annotation)
    @presenter = GalleryImagePresenter.new(@gallery_image)
  end

  describe "#size" do
    it "returns the annotations text formatted" do
      expect(GalleryImage.photo_styles.keys).to include(@presenter.size.to_sym)
    end
  end
  
  describe "#width" do
    it "returns the width" do
      allow(@presenter).to receive(:size).and_return("h_123_456")
      expect(@presenter.width).to eql("123")
    end
  end
  
  describe "#height" do
    it "returns the height" do
      allow(@presenter).to receive(:size).and_return("h_123_456")
      expect(@presenter.height).to eql("456")
    end
  end

  describe "#annotations_text" do
    it "returns the annotations text formatted" do
      expect(@presenter.annotations_text).to eql("This is the annotations body! <a href=\"http://maps.google.com?ll=(39&amp;deg; 58&#39; 53&quot; N, -75&amp;deg; 47&#39; 59&quot; W)&amp;z=14\" target=\"_blank\">(39&deg; 58' 53\" N, -75&deg; 47' 59\" W)</a>")
    end
  end

  # Testing of private method here antipattern but I like it :)
  describe "#annotations" do
    it "returns a collection of annotation presenters" do
      expect(@presenter.send(:annotations).first).to be_a(AnnotationPresenter)
    end
  end
  
end