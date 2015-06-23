class AddPhotoProcessingToGalleryImage < ActiveRecord::Migration
  def change
    add_column :gallery_images, :photo_processing, :boolean
  end
end
