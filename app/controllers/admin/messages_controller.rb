class Admin::MessagesController <  Admin::AdminController
  before_action :set_admin_message, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @admin_messages = Admin::Message.all
    respond_with(@admin_messages)
  end

  def show
    respond_with(@admin_message)
  end

  def new
    @admin_message = Admin::Message.new
    respond_with(@admin_message)
  end

  def edit
  end

  def create
    @admin_message = Admin::Message.new(message_params)
    @admin_message.save
    respond_with(@admin_message)
  end

  def update
    @admin_message.update(message_params)
    respond_with(@admin_message)
  end

  def destroy
    @admin_message.destroy
    respond_with(@admin_message)
  end

  private
    def set_admin_message
      @admin_message = Admin::Message.find(params[:id])
    end

    def admin_message_params
      params.require(:admin_message).permit(:is_actual, :is_deleted, :date, :category_id, :name, :phone, :email, :title, :body, :homestead_id)
    end
end
