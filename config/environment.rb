# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true

# TODO - Set timeout
ActionMailer::Base.smtp_settings = {
  address: SETTINGS[:mail][:address],
  port: SETTINGS[:mail][:port],
  domain: SETTINGS[:mail][:domain],
  user_name: SETTINGS[:mail][:user_name],
  password: Rails.application.secrets.email_password,
  authentication: SETTINGS[:mail][:authentication],
  enable_starttls_auto: SETTINGS[:mail][:enable_starttls_auto]
}