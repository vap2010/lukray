class MainController < ApplicationController

  before_filter :get_page
  layout 'application_hill'


  def home
    @a = 1 #if is_main_page?  
    @big_images_arr = BigImage.published.where(:category_id => Category.bigvisuals.first.id)  #.map{|im| im.picture.url}
    @infoblocks = Banner.infoblocks
  end

  def page
    @page ||= Page.find(params[:id])
    if @page.has_script_after =~ /\Amap-/ 
      uch = []
      uch = [1]   if @page.id == 8 
      uch = [2,3] if @page.id == 9 
      uch = [2,3] if @page.id == 10 
      @homesteads = Homestead.where(:domain_id => uch)   #  params[:id]     
    end
    
    render action: :page and return 
  end

  def modal
    @homestead = Homestead.find(params[:id])
    render layout: false
  end

  def price
    @homesteads1 = Homestead.site_num_sort(Homestead.mkr1)
    @homesteads2 = Homestead.site_num_sort(Homestead.mkr2)
    @homesteads3 = Homestead.site_num_sort(Homestead.mkr3)    
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
