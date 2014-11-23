module ApplicationHelper

  def readable_controller(controller)
    controller = controller.sub(/^admin\//,'')
    "> ".html_safe << controller.capitalize!
  end

  def readable_action(action)
    return "" if action == 'index'
    "> ".html_safe << action.capitalize
  end
  
end
