class Admin::PagesController < Admin::AdminController
  before_action :set_admin_page, only: [:show, :edit, :update, :destroy]
  respond_to :html
  

  def index
    @admin_pages = Admin::Page.all
    respond_with(@admin_pages)
  end

  def show
    respond_with(@admin_page)
  end

  def new
    @admin_page = Admin::Page.new
    respond_with(@admin_page)
  end

  def edit
  end

  def create
    @admin_page = Admin::Page.new(admin_page_params)
    @admin_page.save
    respond_with(@admin_page)
  end

  def update
    @admin_page.update(admin_page_params)
    respond_with(@admin_page)
  end

  def destroy
    @admin_page.destroy
    respond_with(@admin_page)
  end

  private
    def set_admin_page
      @admin_page = Admin::Page.find(params[:id])
    end

    def admin_page_params
      params.require(:admin_page).permit(:parent_id, :position, :is_deleted, 
             :is_published, :is_shown_in_menu, :is_preview_published, :title, 
             :menu_title, :announce, :body, :script_after)
    end
end
