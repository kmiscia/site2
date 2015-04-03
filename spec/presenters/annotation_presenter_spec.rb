require "rails_helper"

describe AnnotationPresenter do

  before(:each) do
    @annotation = create(:annotation)
    @presenter = AnnotationPresenter.new(@annotation)
  end

  describe "#gps_link" do
    it "returns a link to the gps coordinates" do
      expect(@presenter.gps_link).to eql("<a href=\"http://maps.google.com?ll=(39&amp;deg; 58&#39; 53&quot; N, -75&amp;deg; 47&#39; 59&quot; W)&amp;z=14\" target=\"_blank\">(39&deg; 58' 53\" N, -75&deg; 47' 59\" W)</a>")
    end
  end
  
  describe "#model" do
    it "returns the wrapped model" do
      expect(@presenter.model).to eql(@annotation)
    end
  end
end