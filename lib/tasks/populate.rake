namespace :dev do

  desc "Seeds a DB with data for dev work"
  task :populate => :environment do 
    
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
    
    # Articles
    Article.delete_all
    12.times do |index|
      index += 1
      
      category = Category.all[index % 4]
      
      article = Article.new({
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
      })
      
      p "Creating #{article} #{index}"
      article.save_and_process
      
      3.times do |comment_index|
        Comment.create({
          body: "This is comment #{comment_index} for #{article.title}",
          article: article
        })
      end
    end

    #Galleries
    GalleryImage.delete_all
    Gallery.delete_all
    5.times do |gallery_index|
      gallery_index += 1
      
      gallery = Gallery.create(name: "Gallery #{gallery_index}")
      
      4.times do |gallery_image_index|
        gallery_image_index += 1
      
        gallery_image = GalleryImage.new({
          gallery: Gallery.first, 
          name: "Gallery Image", 
          photo: File.new("#{Rails.root}/lib/tasks/populate/gallery_image.jpg")
        })
      
        p "Creating #{gallery_image.to_s}"
      
        gallery_image.save
      end
    end

    Rake::Task["ts:index"].invoke
  end
end