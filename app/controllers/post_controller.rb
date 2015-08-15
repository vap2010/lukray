class PostController < ApplicationController

  before_filter :get_page
  before_action :set_message, only: [:edit, :update]
  before_action :get_srcurl,  only: [:edit, :update]
  
  respond_to :html
  layout 'application_hill'
  

  def viewing_areas
  end

  def consultation
  end

  def back_call
  end

  def booking_area
  end

  def question_from_site
    @message = Message.new
  end

  def recommendation
  end

  def fsm_status
  end

  def business
  end

  def other
  end

  
  def in_viewing_areas
  end
  
  def in_consultation
  end
  
  def in_back_call
    get_srcurl
    create
    RequestMailler.site_request_post(@message).deliver    #_later
    # render nothing: true
    redirect_to @srcurl.to_s 
  end
  
  def in_booking_area
  end
  
  def in_question_from_site
    create
    redirect_to :question_from_site
  end
  
  def in_recommendation
  end
  
  def in_fsm_status
  end
  
  def in_business
  end
  
  def in_other  
  end
  
 
  
  protected
  
    def get_page
      @page = Page.find 1
      @page ||= Page.find_by_id(params[:id])    
      @toppage = @page.find_toppage if @page
    end
    
    def create(cat = nil)
      @message = Message.new(message_params)
      @message.category_id = cat
      @message.save
      # respond_with(@message)
    end
  
    def update
      @message.update(message_params)
      # respond_with(@message)
    end

    def get_srcurl
      @srcurl ||= params[:srcurl]
      params[:srcurl] = nil 
    end

  private
    def set_message
      @message ||= Message.find(params[:id]) if params[:id]
    end

    def message_params
      params.require(:message).permit(:is_actual, :is_deleted, :date, :category_id, :name, :phone, :email, :title, :body, :homestead_id, :srcurl)
    end

  
end

=begin

на просмотр участков, 
- на консультацию по подбору, 
- на обратный звонок, 
- заявка на бронирование, 
- вопрос с сайта,
- рекомендация клиента,
- заявка на статус "внс"
- деловое предложение,
- все прочие. 


Message

bundle exec rails g scaffold 'admin/message'  is_actual:boolean  is_deleted:boolean  date:datetime category_id:integer name:string phone:string  email:string  title:string  body:text  homestead_id:integer  -p 

- просмотр участков 
- консультация
- обратный звонок 
- бронирование участка 
- вопрос с сайта
- рекомендация
- заявка на статус внс
- деловое предложение
- прочие 

 viewing_areas  consultation  back_call  booking_area question_from_site recommendation fsm_status business other


  def in_viewing_areas
  def in_consultation
  def in_back_call
  def in_booking_area
  def in_question_from_site'
  def in_recommendation
  def in_fsm_status
  def in_business
  def in_other
  

=end
