class AddFilterMaskToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :filter_mask, :integer
    add_index :categories, :filter_mask, unique: true
  end
end
