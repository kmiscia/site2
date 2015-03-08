require 'rails_helper'

describe ApplicationHelper do
  helper ApplicationHelper

  it "formats time for admin" do
    assert_equal time_format_admin(Time.new(2014, 3, 14, 15, 23, 45)), "March 14, 2014 3:23 PM"
  end

  it "formats time for regular" do
    assert_equal time_format(Time.new(2014, 3, 14, 15, 23, 45)), "Fri Mar 14 at 03:23 PM"
  end

  it "returns active when on controller" do
    assert_equal side_nav_class('test'), "active"
  end

  it "returns inactive when not on controller" do
    assert_equal side_nav_class('not test'), "inactive"
  end
  
  it "returns an empty string when it can't find the content body" do
    assert_equal content_body(:no_content), ""
  end
  
  it "returns the appropriate content body" do
    content = create(:content, name_slug: "test_content", body: "This is the test <b>body</b>")
    assert_equal content_body(:test_content), "This is the test <b>body</b>"
  end
end
