class CreateAnnotation < ActiveRecord::Migration
  def change
    create_table :annotations do |t|
      t.integer :gallery_image_id, :null => false
      t.string :body
      t.string :gps_coordinates
      t.timestamps
    end
  end
end
