##
# Backup Generated: misciadotnetbackup
# Once configured, you can run the backup with the following command:
#
# $ backup perform -t misciadotnetbackup [-c <path_to_configuration_file>]
#
# For more information about Backup's components, see the documentation at:
# http://backup.github.io/backup
#

SETTINGS = YAML.load_file("#{ENV['APP_ROOT']}/config/settings.yml")['production']
SECRETS = YAML.load_file("#{ENV['APP_ROOT']}/config/secrets.yml")['production']

Backup::Model.new(:misciadotnetbackup, 'A backup of all user generated content for miscia.net') do

  archive :article_paperclip_files do |archive|
    archive.add File.join("#{ENV['APP_ROOT']}/public/system")
    archive.use_sudo
  end

  database PostgreSQL do |db|
    db.name = SECRETS['database']['name']
    db.username = SECRETS['database']['username']
    db.password = SECRETS['database']['password']
    db.host = "localhost"
  end

  store_with S3 do |s3|
    s3.access_key_id = SECRETS['amazon']['access_key']
    s3.secret_access_key = SECRETS['amazon']['secret_key']
    s3.region = 'us-east-1'
    s3.bucket = 'misciadotnet-bu'
    s3.path = 'backups'
  end

  notify_by Mail do |mail|
    mail.on_success = true
    mail.on_warning = true
    mail.on_failure = true

    mail.from = SETTINGS['mail']['user_name']
    mail.to = SETTINGS['mail']['user_name']
    mail.address = SETTINGS['mail']['address']
    mail.port = 587
    mail.domain = SETTINGS['mail']['domain']
    mail.user_name = SETTINGS['mail']['user_name']
    mail.password = SECRETS['email_password']
    mail.authentication = SETTINGS['mail']['authentication']
    mail.encryption = :starttls
  end
end