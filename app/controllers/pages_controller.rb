class PagesController < BaseController
  
  def show
    @contents = Content.where(name_slug: params[:name_slug])
  end
end