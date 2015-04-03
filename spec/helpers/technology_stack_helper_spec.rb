require 'rails_helper'

describe TechnologyStackHelper do
  helper TechnologyStackHelper

  describe "#relative_screenshots_path" do
    it "returns a relative path for a screenshot" do
      expect(relative_screenshots_path("testfile.jpg")).to eql("/screenshots/testfile.jpg")
    end
  end
end
