class CreateContent < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :name, size: 255
      t.string :name_slug, size: 255
      t.text :body, null: false
      t.boolean :system, default: false, null: false
      t.boolean :display_name, default: false, null: false
      t.timestamps
    end
  end
end
