class Gallery < ActiveRecord::Base
  
  validates_presence_of :name
  
  has_many :gallery_images
  accepts_nested_attributes_for :gallery_images, :allow_destroy => true
end