class ArticlesController < ApplicationController

  respond_to :html

  #before_filter :calculate_filter_mask

  def index

    @articles = Article.filter(session, params)

    respond_with do |format|
      format.html do
        if request.xhr?
          render :partial => "/site/article/article_list", :locals => { :articles => @articles }, :layout => false, :status => :created
        else
          redirect_to :root
        end
      end
    end

  end  
end