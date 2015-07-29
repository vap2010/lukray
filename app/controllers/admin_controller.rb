class AdminController < ApplicationController

  before_filter :authenticate_user!    #, except => [:show, :index]
  before_filter :check_user_access! 


  ##   load_and_authorize_resource param_method: :my_sanitizer
#

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end


  private

  def check_user_access!
    redrect_to root_url unless current_user.admin?
  end



  ##   def my_sanitizer
  ##     params.require(:article).permit(:name)
  ##   end
  ##

end
