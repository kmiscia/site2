class CreateGalleryImage < ActiveRecord::Migration
  def change
    create_table :gallery_images do |t|
      t.integer :gallery_id, :null => false
      t.string :name
      t.string :md5
      t.integer :width
      t.integer :height
      t.timestamps
    end
  end
end
