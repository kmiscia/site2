=begin
require "rails_helper"

describe Annotation do

  before(:each) do
    @annotation = create(:annotation)
  end

  it { should belong_to(:gallery_image) }
  it { should allow_value('40.932592,12.345093').for(:gps_coordinates) }
end
=end
