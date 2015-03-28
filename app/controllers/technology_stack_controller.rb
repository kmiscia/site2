class TechnologyStackController < BaseController
  
  def index
    screenshots_dir = File.join(Rails.root, "public", SETTINGS[:screenshots_dir], "/*")
    @screenshots = Dir.glob(screenshots_dir).collect do |screenshot|
      File.basename(screenshot)
    end
  end
end
