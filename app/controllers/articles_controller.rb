class ArticlesController < ApplicationController

  respond_to :html

  before_filter :calculate_filter_mask

  def index

    @articles = Article.filter({
      filter_mask: session[:filter_mask],
      page: params[:page]
    })

    respond_with do |format|
      format.html do
        if request.xhr?
          render :partial => "/articles/list", :locals => { :articles => @articles }, :layout => false, :status => :created
        else
          redirect_to :root
        end
      end
    end

  end  
end