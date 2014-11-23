SETTINGS = HashWithIndifferentAccess.new(YAML.load_file("#{Rails.root.to_s}/config/settings.yml"))
