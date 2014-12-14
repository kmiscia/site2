class GalleryImage < ActiveRecord::Base
  belongs_to :gallery
  
  STYLES = {
    resized: "800x600",
    v_320_500: "320x500",
    v_472_500: "472x500",
    h_350_150: "350x150",
    h_320_180: "320x180",
    h_320_300: "320x300",
    h_540_360: "540x360",
    h_800_600: "800x600",
    h_400_120: "400x120",
    h_300_300: "300x300",
    h_450_300: "450x300"
  }
  
  has_attached_file :photo, :styles => STYLES

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 10.megabytes
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end