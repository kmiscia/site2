class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, size: 1024, null: false
      t.string :header_one, size: 1024
      t.string :header_two, size: 1024
      t.string :url, size: 1024, null: false
      t.text :description
      t.text :body, null: false
      t.string :photo_file_name
      t.string :photo_content_type
      t.string :photo_file_size
      t.string :photo_updated_at
      t.boolean :delta, default: true, null: false
      t.integer :user_id, null: false
      t.integer :category_id
      t.datetime :posted_at
      t.timestamps
    end
  end
end
