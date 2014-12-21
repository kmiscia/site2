require 'rails_helper'

describe Admin::GalleryImageHelper do
  helper Admin::GalleryImageHelper

  it "specifies add field html options" do
    assert_equal add_fields_html_options, {
      "data-association-insertion-node" => ".form-group:nth-last-child(2)",
      "data-association-insertion-method" => "before"
    }
  end
  
  it "formats the name label correctly" do
    assert_equal "Image Name #5", name_label_text(4)
  end
  
  it "formats the photo label correctly" do
    assert_equal "Photo #8", photo_label_text(7)
  end
end
