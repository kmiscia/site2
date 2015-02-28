module ArticleHelper

  def article_title_font(article_index)  
    article_fonts[article_index]
  end
  
  def article_fonts
    {
      1 => "font-family: 'Parisienne', cursive;",
      2 => "font-family: 'Limelight', cursive;",
      3 => "font-family: 'Ewert', cursive;",
      4 => "font-family: 'Voltaire', sans-serif;",
      5 => "font-family: 'Jura', sans-serif;"
    }
  end
end