class MainController < ApplicationController

  before_filter :get_page
  layout 'application_hill'


  def home
    @a = 1 #if is_main_page?  
  end

  def page
    @page ||= Page.find(params[:id])
    render action: :page and return 
  end

  def township
    render action: :page and return 
  end

  def plan
    render action: :page and return 
  end

  def location
    render action: :page and return 
  end

  def infrastructure
    render action: :page and return 
  end

  def nature
    render action: :page and return 
  end

  def gallery
    render action: :page and return 
  end

  def environs
    render action: :page and return 
  end

  def customers
    render action: :page and return 
  end

  def contacts
    render action: :page and return 
  end

  # main menu points
  def main
    render action: :page and return 
  end
  
  def about
    render action: :page and return 
  end
  
  def plan
    render action: :page and return 
  end
  
  def place
    render action: :page and return 
  end
  
  def infro
    render action: :page and return 
  end
  
  def nature
    render action: :page and return 
  end
  
  def around
    render action: :page and return 
  end
  
  def price
    render action: :page and return 
  end
  
  def contact
    render action: :page and return 
  end
  
  def photo
    render action: :page and return 
  end
  
  def sale
    render action: :page and return 
  end
  
  def services
    render action: :page and return 
  end

  
  protected
  
  def get_page
    @page = Page.find_by_alias(action_name)
    @page ||= Page.find_by_id(params[:id])    
    @toppage = @page.find_toppage if @page
  end
  
  
end
