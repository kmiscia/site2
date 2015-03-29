require 'delegate'
 
class GalleryImagePresenter < SimpleDelegator
  
  def annotations
    model.annotations.collect do |annotation|
      AnnotationPresenter.new(annotation)
    end
  end
  
  def annotations_text
    annotations_text = annotations.collect do |annotation|
      "#{annotation.body} #{annotation.gps_link}"
    end
    annotations_text.join(". ")
  end
  
  def size
    display_styles = GalleryImage::STYLES.delete_if { |key, value| key == :resized }
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
  
  def model
    __getobj__
  end
  
end