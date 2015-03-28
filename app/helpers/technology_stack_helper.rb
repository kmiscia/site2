module TechnologyStackHelper
  def relative_screenshots_path(file, size = "")
    File.join(SETTINGS[:screenshots_dir], size.to_s, file)
  end
end