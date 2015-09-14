class Admin::BannersController < Admin::AdminController
  before_action :set_admin_banner, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    # @admin_banners = Admin::Banner.all
    @banners_categories = Category.adm_banners
    respond_with(@admin_banners)
  end

  def show
    respond_with(@admin_banner)
  end

  def new
    @admin_banner = Admin::Banner.new
    respond_with(@admin_banner)
  end

  def edit
  end

  def create
    @admin_banner = Admin::Banner.new(banner_params)
    @admin_banner.save
    respond_with(@admin_banner)
  end

  def update
    @admin_banner.update(banner_params)
    respond_with(@admin_banner)
  end

  def destroy
    @admin_banner.destroy
    respond_with(@admin_banner)
  end

  private
    def set_admin_banner
      @admin_banner = Admin::Banner.find(params[:id])
    end

    def banner_params
      params.require(:admin_banner).permit(:position, :category_id, :is_deleted, :is_published, :has_link, :name, :title, :link, :text, :show_start, :show_end, :image)
    end
end
