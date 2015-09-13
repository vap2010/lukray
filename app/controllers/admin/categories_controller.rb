class Admin::CategoriesController < Admin::AdminController
  before_action :set_admin_category, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @admin_categories = Admin::Category.all
    respond_with(@admin_categories)
  end

  def show
    respond_with(@admin_category)
  end

  def new
    @admin_category = Admin::Category.new
    respond_with(@admin_category)
  end

  def edit
  end

  def create
    @admin_category = Admin::Category.new(admin_category_params)
    @admin_category.save
    respond_with(@admin_category)
  end

  def update
    @admin_category.update(admin_category_params)
    respond_with(@admin_category)
  end

  def destroy
    @admin_category.destroy
    respond_with(@admin_category)
  end

  private
    def set_admin_category
      @admin_category = Admin::Category.find(params[:id])
    end

    def admin_category_params
      params.require(:admin_category).permit(:position, :is_deleted, :is_published, :type_id, :title, :image, :text)
    end
end
