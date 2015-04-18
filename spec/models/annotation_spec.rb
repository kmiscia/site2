require "rails_helper"

describe Annotation do
  it { should belong_to(:gallery_image) }
  it { should allow_value('40.932592').for(:latitude) }
  it { should allow_value('12.345093').for(:longitude) }
end
