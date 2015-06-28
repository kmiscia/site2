# encoding: utf-8

SETTINGS = YAML.load_file("/Users/kmiscia/Workspace/site2/config/settings.yml")['production']
SECRETS = YAML.load_file("/Users/kmiscia/Workspace/site2/config/secrets.yml")['production']

##
# Backup Generated: misciadotnetbackup
# Once configured, you can run the backup with the following command:
#
# $ backup perform -t misciadotnetbackup [-c <path_to_configuration_file>]
#
# For more information about Backup's components, see the documentation at:
# http://backup.github.io/backup
#
Model.new(:misciadotnetbackup, 'A backup of all user generated content for miscia.net') do
  ##
  # Archive [Archive]
  #
  # Adding a file or directory (including sub-directories):
  #   archive.add "/path/to/a/file.rb"
  #   archive.add "/path/to/a/directory/"
  #
  # Excluding a file or directory (including sub-directories):
  #   archive.exclude "/path/to/an/excluded_file.rb"
  #   archive.exclude "/path/to/an/excluded_directory
  #
  # By default, relative paths will be relative to the directory
  # where `backup perform` is executed, and they will be expanded
  # to the root of the filesystem when added to the archive.
  #
  # If a `root` path is set, relative paths will be relative to the
  # given `root` path and will not be expanded when added to the archive.
  #
  #   archive.root '/path/to/archive/root'
  #
  archive :my_archive do |archive|
    # Run the `tar` command using `sudo`
    # archive.use_sudo
    archive.add File.join("/Users/kmiscia/Workspace/site2/public/system")
    archive.use_sudo
  end

  ##
  # PostgreSQL [Database]
  #
  database PostgreSQL do |db|
    # To dump all databases, set `db.name = :all` (or leave blank)
    db.name = SECRETS['database']['name']
    db.username = SECRETS['database']['username']
    db.password = SECRETS['database']['password']
    db.host = "localhost"
    db.port = 5432
    # db.socket = "/tmp/pg.sock"
    # When dumping all databases, `skip_tables` and `only_tables` are ignored.
    db.skip_tables        = ["skip", "these", "tables"]
    db.only_tables        = ["only", "these", "tables"]
    db.additional_options = ["-xc", "-E=utf8"]
  end

  ##
  # Dropbox [Storage]
  #
  # Your initial backup must be performed manually to authorize
  # this machine with your Dropbox account. This authorized session
  # will be stored in `cache_path` and used for subsequent backups.
  #
  store_with Dropbox do |db|
    db.api_key = SECRETS['dropbox']['api_key']
    db.api_secret = SECRETS['dropbox']['api_key']
    # Sets the path where the cached authorized session will be stored.
    # Relative paths will be relative to ~/Backup, unless the --root-path
    # is set on the command line or within your configuration file.
    db.cache_path  = ".cache"
    # :app_folder (default) or :dropbox
    db.access_type = :app_folder
    #db.path = "/path/to/my/backups"
    db.keep = 7
  end

  ##
  # Mail [Notifier]
  #
  # The default delivery method for Mail Notifiers is 'SMTP'.
  # See the documentation for other delivery options.
  #
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
