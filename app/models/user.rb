class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable
         
  has_many :users_roles
  has_many :roles, :through => :users_roles

  before_create :create_role


  def admin?
    ((1..3).to_a.include? self.type_id) and !!('234'.index self.roles.ids.uniq.sort*'')
  end   
  
  def has_role?(role_alias)
    self.roles.include? Role.find_by_alias(role_alias)
  end
  
  private
  def create_role
    # self.roles << Role.find_by_name(:user)  
  end         
         
end
