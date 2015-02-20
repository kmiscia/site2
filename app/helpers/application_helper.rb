module ApplicationHelper

  def time_format(time)
    time.localtime.strftime("%a %b %d at %I:%M %p").gsub(/\s+/, ' ')
  end

  def time_format_admin(time)
    time.localtime.strftime("%B %e, %G %l:%M %p").gsub(/\s+/, ' ')
  end

  def side_nav_class(name)
    controller_name == name ? 'active' : 'inactive'
  end
  
  def content_body(name_slug)
    content = Content.where(:name_slug => name_slug.to_s).first
    content ? content.body.html_safe : ''
  end
end
