desc "Seeds a DB with data for dev work"
task :populate => :environment do
  
  User.destroy_all
  User.create(
    username: "userone",
    email: "userone@miscia.net"
  )
  
  Category.destroy_all
  Category.create(name: "Category One")
  Category.create(name: "Category Two")
  Category.create(name: "Category Three")
  
  Article.destroy_all
  Article.create(
    title: "Article One",
    header_one: "Header One",
    header_two: "Header Two",
    url: "http://www.one.com",
    description: "This is the first article description. This is the first article description. This is the first article description.",
    body: "<b>This is the article body</b>",
    
    
  )
  
end