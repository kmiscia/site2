require 'rails_helper'

describe Admin::SharedHelper do
  helper Admin::SharedHelper

  it "specifies text row html options" do
    assert_equal "col-sm-2 control-label", label_html_options[:class]
  end
  
  it "specifies non-text row html options" do
    options = label_html_options({ :non_text => true })
    assert_equal "col-sm-2 control-label", options[:class]
    assert_equal "padding-top: 0px", options[:style]
  end
end
