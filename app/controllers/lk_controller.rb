# class LkController < ApplicationController
class LkController < AdminController
  # load_and_authorize_resource
  layout 'application_hill'


  def home
  
    # render text: '123' 
    
    
    
    
  end

  def profile
  end

  def order
  end

  def consultation
  end
  
  private

  def my_sanitizer
    params.require(:article).permit(:name)
  end

end
