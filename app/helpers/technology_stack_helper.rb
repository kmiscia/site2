module TechnologyStackHelper
  def relative_screenshots_path(file)
    File.join(SETTINGS[:screenshots_dir], file)
  end
end