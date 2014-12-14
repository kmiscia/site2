module Admin::GalleryImageHelper
  
  # Insert the new form group before the 2nd to last form group. The last two
  # containing the save button and the add link itself.
  def add_fields_html_options
    html_options = {}
    html_options["data-association-insertion-node"] = ".form-group:nth-last-child(2)"
    html_options["data-association-insertion-method"] = "before"
    html_options
  end
  
  def name_label_text(index)
    "Image Name ##{(index.to_i + 1)}"
  end
  
  def photo_label_text(index)
    "Photo ##{(index.to_i + 1)}"
  end
end