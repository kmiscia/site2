class Admin::ContentsController < Admin::BaseController

  def index
    @contents = Content.all.order("created_at DESC")
  end

  def edit
    @content = Content.find(params[:id])
  end

  def new
    @content = Content.new
  end

  def create

    @content = Content.new(content_params)

    if @content.save
      flash[:success] = "Content created successfully."
      redirect_to admin_contents_path
    else
      flash[:danger] = "An error occurred while creating the content. #{@content.errors.full_messages.join(', ')}"
      render :new
    end
  end

  def update

    @content = Content.find(params[:id])

    if @content.update_attributes(content_params)
      flash[:success] = "Content updated successfully."
      redirect_to admin_contents_path
    else
      flash[:danger] = "An error occurred while saving the content. #{@content.errors.full_messages.join(', ')}"
      render :edit
    end
  end

  def destroy
    if Content.destroy(params[:id])
      flash[:success] = "Content deleted successfully."
    else
      flash[:danger] = "An error occurred while deleting the content."
    end
    redirect_to admin_contents_path
  end

  private

  def content_params
    attrs = params.require(:content).permit([
      :name,
      :name_slug,
      :body,
      :system,
      :display_name
    ])
  end
end
