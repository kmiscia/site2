module Admin::SharedHelper
  
  # non_text is for things like checkboxes and spans that
  # don't need the padding associated with a text field
  def label_html_options(non_text = false)
    label_html_options = {}
    label_html_options[:class] = "col-sm-2 control-label"
    label_html_options[:style] = "padding-top: 0px" if non_text
    label_html_options
  end
  
end