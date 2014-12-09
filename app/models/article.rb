class Article < ActiveRecord::Base

  belongs_to :user
  belongs_to :category
  has_many :comments

  has_attached_file :photo,
    :styles => { :cropped => "100%" },
    :processors => [:cropper]

  validates_presence_of :title, :body, :url
  validates_uniqueness_of :title

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  def save_and_process(attributes = {})
    status = update_attributes(attributes)
    photo.reprocess! if status && cropping?
    status
  rescue
    return false
  end

  def cropping?
    crop_x.present? &&
    crop_y.present? &&
    crop_w.present? &&
    crop_h.present?
  end
end
