namespace :dev do

  desc "Seeds a DB with data for dev work"
  task :populate => :environment do 
    
    # Users
    User.destroy_all
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
    Category.destroy_all
    Category.create(name: "snowboard")
    Category.create(name: "running")
    Category.create(name: "assorted")
    Category.create(name: "web")
    
    # Articles
    Article.destroy_all
    12.times do |index|
      index += 1
      article = Article.create(
        title: "Article #{index}",
        header_one: "Header #{index}",
        header_two: "Header #{index}",
        url: "http://www.#{index}.com",
        description: "Article description #{index}. Article description #{index}. Article description #{index}. Article description #{index}.",
        body: "<b>This is the article body</b>",
        photo: File.new("#{Rails.root}/lib/tasks/populate/article_one.jpg"),
        user: User.first,
        category: Category.first, 
        posted_at: Time.now
      )
      
      article.save_and_process({
        crop_x: 20,
        crop_y: 20, 
        crop_w: 594,
        crop_h: 95  
      })
    end
    
    #Galleries
    5.times do |gallery_index|
      gallery_index += 1
      
      gallery = Gallery.create(name: "Gallery #{gallery_index}")
      
      4.times do |gallery_image_index|
        gallery_image_index += 1
      
        GalleryImage.create(
          gallery: gallery,
          name: "Gallery Image #{gallery_image_index}",
          photo: File.new("#{Rails.root}/lib/tasks/populate/article_one.jpg")
        )
      end
    end

  end
end