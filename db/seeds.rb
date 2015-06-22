# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Categories
Category.delete_all
Category.create(name: "snowboard")
Category.create(name: "running")
Category.create(name: "assorted")
Category.create(name: "web")

Content.delete_all
Dir.glob(File.join(Rails.root, "config/system_contents/*.html")) do |html_file|
  Content.create!({
    name: File.basename(html_file, '.*').titleize,
    name_slug: File.basename(html_file, '.*'),
    system: true,
    display_name: true,
    body: File.open(html_file, "rb").read
  })
end

User.delete_all
User.create!({
  username: "kmiscia",
  email: "kmiscia@miscia.net",
  password: Rails.application.secrets.default_user_password,
  password_confirmation: Rails.application.secrets.default_user_password
})