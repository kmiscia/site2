class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.integer :article_id, null: false
      t.integer :user_id
      t.timestamps
    end
  end
end
