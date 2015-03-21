class ArticlesController < ApplicationController

  respond_to :html

  before_filter :calculate_filter_mask
  before_filter :require_xhr

  def index
    
    @articles = Article.filter({
      filter_mask: session[:filter_mask],
      page: params[:page]
    })

    render partial: "/articles/list", 
      locals: { articles: @articles }, 
      layout: false, 
      status: :created
  end  
end