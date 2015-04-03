module ArticleHelper

  def article_title_font(article_index)  
    article_fonts[article_index]
  end
  
  def article_fonts
    [
      "font-family: 'Parisienne', cursive;", 
      "font-family: 'Limelight', cursive;", 
      "font-family: 'Ewert', cursive;", 
      "font-family: 'Voltaire', sans-serif;", 
      "font-family: 'Jura', sans-serif;"
    ]
  end
end