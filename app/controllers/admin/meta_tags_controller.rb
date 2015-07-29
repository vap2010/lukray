class Admin::MetaTagsController < Admin::AdminController
  before_action :set_admin_meta_tag, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @admin_meta_tags = Admin::MetaTag.all
    respond_with(@admin_meta_tags)
  end

  def show
    respond_with(@admin_meta_tag)
  end

  def new
    @admin_meta_tag = Admin::MetaTag.new
    respond_with(@admin_meta_tag)
  end

  def edit
  end

  def create
    @admin_meta_tag = Admin::MetaTag.new(meta_tag_params)
    @admin_meta_tag.save
    respond_with(@admin_meta_tag)
  end

  def update
    @admin_meta_tag.update(meta_tag_params)
    respond_with(@admin_meta_tag)
  end

  def destroy
    @admin_meta_tag.destroy
    respond_with(@admin_meta_tag)
  end

  private
    def set_admin_meta_tag
      @admin_meta_tag = Admin::MetaTag.find(params[:id])
    end

    def admin_meta_tag_params
      params.require(:admin_meta_tag).permit(:title, :description, :keywords, :url, :metatagable_id, :metatagable_type, :no_cache, :noindex, :nofollow, :is_redirect, :redirect_uri, :hits_count)
    end
end
