namespace :dev do

  desc "Seeds a DB with data for dev work"
  task :populate => :environment do 
    
    # Contents
    Content.delete_all
    Content.create(
      name: "Footer Left",
      name_slug: "footer_left",
      body: "Welcome to a truly unique and engaging website. And by unique and engaging, I mean not at all. There are many sites like this, but this one is mine. It was created by myself, and is a place I like to test out new technology and collect interesting info. Take a look around and check out some of the things I enjoy.",   
      system: true,
      display_name: true
    )
    
    Content.create(
      name: "Footer Middle",
      name_slug: "footer_middle",
      body: "<p>My name is Kevin Miscia and I'm a software developer and wannabe runner currently hanging my hat in Philadelphia, PA. I'm a Villanova alum with experience in a variety of different web frameworks, and when I'm not out and about on the trails of Philadelphia, I'm making a home for myself in the Ruby on Rails community. <a href=\"../../../page/abstract\">I must know more...</a></p>",   
      system: true,
      display_name: true
    )
    
    # Users
    User.delete_all
    3.times do |index|
      index += 1
      User.create(
        username: "user#{index}",
        email: "user#{index}@miscia.net",
        password: "password",
        password_confirmation: "password"
      )
    end
    
    # Categories
    Category.delete_all
    Category.create(id: 1, name: "snowboard")
    Category.create(id: 2, name: "running")
    Category.create(id: 4, name: "assorted")
    Category.create(id: 8, name: "web")
    
    # Articles
    Article.delete_all
    12.times do |index|
      index += 1
      
      category = Category.all[index % 4]
      
      article = Article.create(
        title: "Article #{index}",
        header_one: "Header #{index}",
        header_two: "Header #{index}",
        url: "http://www.#{index}.com",
        description: "Article description #{index}. Article description #{index}. Article description #{index}. Article description #{index}.",
        body: "<b>This is the article body</b>",
        photo: File.new("#{Rails.root}/lib/tasks/populate/#{category.name}.jpg"),
        user: User.first,
        category: category,
        posted_at: Time.now
      )
    end
    
    #Galleries
    GalleryImage.delete_all
    Gallery.delete_all
    5.times do |gallery_index|
      gallery_index += 1
      
      gallery = Gallery.create(name: "Gallery #{gallery_index}")
      
      4.times do |gallery_image_index|
        gallery_image_index += 1
      
        GalleryImage.create(
          gallery: gallery,
          name: "Gallery Image #{gallery_image_index}",
          photo: File.new("#{Rails.root}/lib/tasks/populate/gallery_image.jpg")
        )
      end
    end

    Rake::Task["ts:index"].invoke
  end
end