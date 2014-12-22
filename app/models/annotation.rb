class Annotation < ActiveRecord::Base

  belongs_to :gallery_image

  validates_format_of :latitude, :longitude,
    with: /\A[ ]*[-]?[0-9]+.[0-9]+[ ]*/,
    allow_blank: true,
    message: "is in invalid format."
end
