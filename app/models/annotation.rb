class Annotation < ActiveRecord::Base

  belongs_to :gallery_image

  validates_format_of :gps_coordinates,
    with: /\A[ ]*[-]?[0-9]+.[0-9]+[ ]*,[ ]*[-]?[0-9]+.[0-9]+[ ]*/,
    allow_blank: true,
    message: "is in invalid format."
end
