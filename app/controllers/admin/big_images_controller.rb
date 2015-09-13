class Admin::BigImagesController < Admin::AdminController
  before_action :set_admin_big_image, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @admin_big_images = Admin::BigImage.all
    @big_images_categories = Category.where(type_id: 8).order(:position) 
    respond_with(@admin_big_images)
  end

  def show
    respond_with(@admin_big_image)
  end

  def new
    @admin_big_image = Admin::BigImage.new
    respond_with(@admin_big_image)
  end

  def edit
  end

  def create
    @admin_big_image = Admin::BigImage.new(admin_big_image_params)
    @admin_big_image.save
    respond_with(@admin_big_image)
  end

  def update
    @admin_big_image.update(admin_big_image_params)
    respond_with(@admin_big_image)
  end

  def destroy
    @admin_big_image.destroy
    respond_with(@admin_big_image)
  end

  private
    def set_admin_big_image
      @admin_big_image = Admin::BigImage.find(params[:id])
    end

    def admin_big_image_params
      params.require(:admin_big_image).permit(:position, :is_public, :is_deleted, :category_id, :title, :params, :preview, :picture)
    end
end
