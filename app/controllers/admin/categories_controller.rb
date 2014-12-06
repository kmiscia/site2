class Admin::CategoriesController < Admin::BaseController

  def index
    @categories = Category.all.order("created_at DESC")
  end

  def edit
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create

    @category = Category.new(category_params)

    if @category.save
      flash[:success] = "Category created successfully."
      redirect_to admin_categories_path
    else
      flash[:danger] = "An error occurred while creating the category. #{@category.errors.full_messages.join(', ')}"
      render :new
    end
  end

  def update

    @category = Category.find(params[:id])

    if @category.update_attributes(category_params)
      flash[:success] = "Category updated successfully."
      redirect_to admin_categories_path
    else
      flash[:danger] = "An error occurred while saving the category. #{@category.errors.full_messages.join(', ')}"
      render :edit
    end
  end

  def destroy
    if Category.destroy(params[:id])
      flash[:success] = "Category deleted successfully."
    else
      flash[:danger] = "An error occurred while deleting the category."
    end
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit([:name])
  end
end
