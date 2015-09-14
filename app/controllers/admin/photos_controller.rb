class Admin::PhotosController < Admin::AdminController
  before_action :set_admin_photo, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    #  @admin_photos = Admin::Photo.all
    @photos_categories = Category.adm_picgallery
    respond_with(@admin_photos)
  end

  def show
    respond_with(@admin_photo)
  end

  def new
    @admin_photo = Admin::Photo.new
    respond_with(@admin_photo)
  end

  def edit
  end

  def create
    @admin_photo = Admin::Photo.new(photo_params)
    @admin_photo.save
    respond_with(@admin_photo)
  end

  def update
    @admin_photo.update(photo_params)
    respond_with(@admin_photo)
  end

  def destroy
    @admin_photo.destroy
    respond_with(@admin_photo)
  end

  private
    def set_admin_photo
      @admin_photo = Admin::Photo.find(params[:id])
    end

    def photo_params
      params.require(:admin_photo).permit(:position, :category_id, :is_deleted, :is_published, :is_shown_in_menu, :is_preview_published, :skin_id, :title, :menu_title, :announce, :body, :preview, :image)
    end
end
