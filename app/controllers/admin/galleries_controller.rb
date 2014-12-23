class Admin::GalleriesController < Admin::BaseController

  def index
    @galleries = Gallery.all.order("created_at DESC")
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def new
    @gallery = Gallery.new
  end

  def create

    @gallery = Gallery.new(gallery_params)

    if @gallery.save
      flash[:success] = "Gallery created successfully."
      redirect_to admin_galleries_path
    else
      flash[:danger] = "An error occurred while creating the gallery. #{@gallery.errors.full_messages.join(', ')}"
      render :new
    end
  end

  def update

    @gallery = Gallery.find(params[:id])

    if @gallery.update_attributes(gallery_params)
      flash[:success] = "Gallery updated successfully."
      redirect_to admin_galleries_path
    else
      flash[:danger] = "An error occurred while saving the gallery. #{@gallery.errors.full_messages.join(', ')}"
      render :edit
    end
  end

  def destroy
    if Gallery.destroy(params[:id])
      flash[:success] = "Gallery deleted successfully."
    else
      flash[:danger] = "An error occurred while deleting the gallery."
    end
    redirect_to admin_galleries_path
  end

  private

  def gallery_params
    params.require(:gallery).permit(:name, gallery_image_params)
  end
  
  def gallery_image_params
    { gallery_images_attributes: [
      :id, 
      :name, 
      :photo, 
      :_destroy,
      annotation_params
    ]}
  end
  
  def annotation_params
    { annotations_attributes: [ 
      :id,
      :latitude, 
      :longitude, 
      :body,
      :_destroy
    ]}
  end
end
