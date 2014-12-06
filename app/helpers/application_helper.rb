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
end
