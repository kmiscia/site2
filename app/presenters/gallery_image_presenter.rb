require 'delegate'
 
class GalleryImagePresenter < SimpleDelegator
  
  def annotations_text
    annotations_text = annotations.collect do |annotation|
      "#{annotation.body} #{annotation.gps_link}"
    end
    annotations_text.join(". ")
  end
  
  def size
    display_styles = GalleryImage.photo_styles.delete_if { |key, value| key.to_sym == :resized }
    @size ||= display_styles.keys.sample.to_s
  end
  
  def width
    if width = size.match(/[hv]_([\d]*)_[\d]*/)
      width[1]
    end
  end
  
  def height
    if height = size.match(/[hv]_[\d]*_([\d]*)/)
      height[1]
    end
  end
  
  private
  
  def annotations
    __getobj__.annotations.collect do |annotation|
      AnnotationPresenter.new(annotation)
    end
  end
  
end