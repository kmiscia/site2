class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|

      t.string :title, size: 1024, null: false
      t.string :header_one, size: 1024, null: true
      t.string :header_two, size: 1024, null: true
      t.string :url, size: 1024, null: false
      t.text :description, null: true
      t.text :body, null: false
      t.integer :user_id, null: false
      t.integer :category_id, null: true
      t.datetime :posted_at, null: true

      t.timestamps
    end
  end
end
