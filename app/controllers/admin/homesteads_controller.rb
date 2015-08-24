class Admin::HomesteadsController < Admin::AdminController
  before_action :set_admin_homestead, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @admin_homesteads = Admin::Homestead.all
    respond_with(@admin_homesteads)
  end

  def mkr1
    @admin_homesteads = Admin::Homestead.where(:domain_id => 1).sort{|h1, h2| h1.site_num.to_s.to_i <=> h2.site_num.to_s.to_i}
    respond_with(@admin_homesteads)  do |format|
      format.html { render template: 'admin/homesteads/index' }
    end
  end

  def mkr2
    @admin_homesteads = Admin::Homestead.where(:domain_id => 2).sort{|h1, h2| h1.site_num.to_s.to_i <=> h2.site_num.to_s.to_i}
    respond_with(@admin_homesteads)  do |format|
      format.html { render template: 'admin/homesteads/index' }
    end
  end
  
  def mkr3
    @admin_homesteads = Admin::Homestead.where(:domain_id => 3).sort{|h1, h2| h1.site_num.to_s.to_i <=> h2.site_num.to_s.to_i}
    respond_with(@admin_homesteads)  do |format|
      format.html { render template: 'admin/homesteads/index' }
    end
  end

  def stats
    @domain = Homestead.get_stat_for_select('domain', :domain_id)  
    @sector = Homestead.mkr1.get_stat_for_select('sectors', :sector_id)  
    @phases = Homestead.get_stat_for_select('phases', :phase)  
    @s      = Homestead.all.inject(0){|s, h| s += h.square_meters.to_s.to_i} 
    @s1     = Homestead.mkr1.inject(0){|s, h| s += h.square_meters.to_s.to_i} 
    @s2     = Homestead.mkr2.inject(0){|s, h| s += h.square_meters.to_s.to_i} 
    @s3     = Homestead.mkr3.inject(0){|s, h| s += h.square_meters.to_s.to_i} 
    @n1     = Homestead.only_private_h.mkr1.size 
    @n2     = Homestead.only_private_h.mkr2.size 
    @n3     = Homestead.only_private_h.mkr3.size     
    
    @cost = {}
    @plosh = {}
    Admin::Homestead.all.each do |h|
      cost_base = h.price.to_s.to_i / 100000
      cost_key = (cost_base).to_s + '00-' + (cost_base + 1).to_s + '00'
      @cost[cost_key] ||= 0
      @cost[cost_key]  += 1
      
      plosh_base = h.square_meters.to_s.to_i / 100
      plosh_key = (plosh_base).to_s + '00-' + (plosh_base + 1).to_s + '00'
      @plosh[plosh_key] ||= 0
      @plosh[plosh_key]  += 1
    end
  end


  def show
    respond_with(@admin_homestead)
  end

  def new
    @admin_homestead = Admin::Homestead.new
    respond_with(@admin_homestead)
  end

  def edit
  end

  def create
    @admin_homestead = Admin::Homestead.new(homestead_params)
    @admin_homestead.save
    respond_with(@admin_homestead)
  end

  def update
    @admin_homestead.update(homestead_params)
    respond_with(@admin_homestead)
  end

  def destroy
    @admin_homestead.destroy
    respond_with(@admin_homestead)
  end

  private
    def set_admin_homestead
      @admin_homestead = Admin::Homestead.find(params[:id])
    end

    def homestead_params
      params.require(:admin_homestead).permit(:domain_id, :land_use_id, :site_num, :cadastral_num, :phase, 
      :status_id, :acreage_s, :price, :discount, :has_coast, :has_forest, :corner_site, :outside_site, 
      :land_link_id, :shape_id, :slope, :altitude, :k_interes, :k_browsing, :neighbors, :note,
      :booked_date, :distance_to_lake, :has_basement, :has_building)
    end
end


