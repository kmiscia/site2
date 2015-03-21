# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true

# TODO - Set timeout
ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: "miscia.net",
  user_name: "kmiscia@miscia.net",
  password: Rails.application.secrets.email_password,
  authentication: "plain",
  enable_starttls_auto: true
}