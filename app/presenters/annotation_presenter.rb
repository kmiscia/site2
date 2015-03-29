require 'delegate'
 
class AnnotationPresenter < SimpleDelegator
  
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::OutputSafetyHelper
  
  def gps_link
    return "" if gps_coordinates.blank?
    link_to(gps_coordinates, gps_link_url, :target => "_blank") 
  end
  
  def model
    __getobj__
  end
  
  private
  
  def gps_link_url
    "http://maps.google.com?ll=#{gps_coordinates}&z=14"
  end
  
  def gps_coordinates
    formatted_gps = []
    formatted_gps << "#{latitude_degrees.to_i}&deg;"
    formatted_gps << "#{latitude_hours.to_i}'"
    formatted_gps << "#{latitude_minutes.to_i}\""
    formatted_gps << "#{latitude_cardinal},"
    formatted_gps << "#{longitude_degrees.to_i}&deg;"
    formatted_gps << "#{longitude_hours.to_i}'"
    formatted_gps << "#{longitude_minutes.to_i}\""
    formatted_gps << "#{longitude_cardinal}"
    raw("(#{formatted_gps.join(" ")})")
  end
  
  def latitude_degrees
    latitude.to_i
  end

  def latitude_hours
    (latitude % 1) * 60
  end

  def latitude_minutes
    (latitude_hours % 1) * 60 
  end

  def longitude_degrees
    longitude.to_i
  end

  def longitude_hours
    (longitude % 1) * 60
  end

  def longitude_minutes
    (longitude_hours % 1) * 60 
  end

  def latitude_cardinal
    latitude >= 0 ? "N" : "S"
  end

  def longitude_cardinal
    longitude >= 0 ? "E" : "W"
  end
end