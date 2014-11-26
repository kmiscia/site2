class CreateGallery < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.column :path, :string
      t.timestamps
    end
  end
end
