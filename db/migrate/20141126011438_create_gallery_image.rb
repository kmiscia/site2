class CreateGalleryImage < ActiveRecord::Migration
  def change
    create_table :gallery_images do |t|
      t.integer :gallery_id, :null => false
      t.string :name
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.datetime :photo_updated_at
      t.integer :width
      t.integer :height
      t.timestamps
    end
  end
end
