require "rails_helper"

describe AnnotationPresenter do

  before(:each) do
    @annotation = create(:annotation)
    @presenter = AnnotationPresenter.new(@annotation)
  end

  describe "#gps_link" do
    it "returns a link to the gps coordinates" do
      expect(@presenter.gps_link).to eql("<a href=\"http://maps.google.com/maps/@39.981592,-75.200093,15z\" target=\"_blank\">(39&deg; 58' 53\" N, -75&deg; 47' 59\" W)</a>")
    end
  end
  
  describe "#model" do
    it "returns the wrapped model" do
      expect(@presenter.model).to eql(@annotation)
    end
  end
end