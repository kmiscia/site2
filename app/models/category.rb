class Category < ActiveRecord::Base
  has_many :articles
  validates_presence_of :name
  validates_uniqueness_of :name
  
  after_create :set_filter_mask
  
  # The default filter mask if to show all categories, which
  # means the mask is the sum of all their filter masks
  def self.default_filter_mask
    Category.all.map(&:filter_mask).sum
  end
  
  private
  
  def set_filter_mask
    update_attributes(filter_mask: lowest_available_filter_mask)
  end
  
  def lowest_available_filter_mask
    candidate_filter_mask = 1
    while existing_filter_masks.include?(candidate_filter_mask)
      candidate_filter_mask *= 2
    end
    candidate_filter_mask
  end
  
  def existing_filter_masks
    Category.all.map(&:filter_mask)
  end
end
