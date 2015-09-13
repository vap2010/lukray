class Admin::HomeController < Admin::AdminController

  before_filter :supersdmin_access, :only => [:adm]


  def index
  end

  def stats
  end
  


  ##  Superadmin zone  
  
  def adm  
  end
  
  
  protected
  
  def supersdmin_access
    if current_user.has_role? 'superadmin'
      redirect_to '/'
    end
  end
  
  
end
