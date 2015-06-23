class GalleryImage < ActiveRecord::Base
  
  belongs_to :gallery

  has_attached_file :photo, :styles => ->(a){ HashWithIndifferentAccess.new(YAML.load_file(File.join(Rails.root, "config/gallery_image_styles.yml"))) }
  process_in_background :photo, processing_image_url: ActionController::Base.helpers.asset_path("processing.gif")
  
  has_many :annotations, :dependent => :destroy
  accepts_nested_attributes_for :annotations

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 10.megabytes
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]  
end