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
      name: "Miscellany",
      name_slug: "miscellany",
      body: "<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>",   
      system: true,
      display_name: true
    )
    
    Content.create(
      name: "Abstract",
      name_slug: "abstract",
      body: "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>",   
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