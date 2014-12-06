module ApplicationHelper

  def time_format(time)
    time.localtime.strftime("%a %b %d at %I:%M%p")
  end

  def time_format_admin(time)
    time.localtime.strftime("%B %e, %G %l:%M %p")
  end

  def side_nav_class(controller)
    controller_name == controller ? 'active' : 'inactive'
  end
end
