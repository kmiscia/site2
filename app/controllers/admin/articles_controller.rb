class Admin::ArticlesController < Admin::BaseController

  PERMITTED_ATTRS = [
    :title,
    :header_one,
    :header_two,
    :body,
    :url,
    :category_id,
    :photo,
    :crop_x,
    :crop_y,
    :crop_w,
    :crop_h,
    :posted_at
  ]

  def index
    @articles = Article.all.order("created_at DESC")
  end

  def edit
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create

    @article = Article.new(article_params)
    @article.user_id = current_admin_user.id

    if @article.save_and_process(article_params)
      flash[:success] = "Article created successfully."
      redirect_to admin_articles_path
    else
      flash[:danger] = "An error occurred while creating the article. #{@article.errors.full_messages.join(', ')}"
      render :new
    end
  end

  def update

    @article = Article.find(params[:id])

    if @article.save_and_process(article_params)
      flash[:success] = "Article updated successfully."
      redirect_to admin_articles_path
    else
      flash[:danger] = "An error occurred while saving the article. #{@article.errors.full_messages.join(', ')}"
      render :edit
    end
  end

  def destroy
    if Article.destroy(params[:id])
      flash[:success] = "Article deleted successfully."
    else
      flash[:danger] = "An error occurred while deleting the article."
    end
    redirect_to admin_articles_path
  end

  private

  def article_params
    attrs = params.require(:article).permit(PERMITTED_ATTRS)
    attrs[:posted_at] = params[:show_on_site] ? Time.now : nil
    attrs
  end
end
