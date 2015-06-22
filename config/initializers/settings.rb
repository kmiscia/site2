raw_config = File.read("#{::Rails.root.to_s}/config/settings.yml")
SETTINGS = HashWithIndifferentAccess.new(YAML.load(raw_config)[::Rails.env])