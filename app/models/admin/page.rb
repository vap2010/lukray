class Admin::Page < ActiveRecord::Base
  self.table_name = "pages"
  
  belongs_to :parent, class_name: 'Admin::Page'
  has_many :children, class_name: 'Admin::Page', foreign_key: :parent_id, dependent: :destroy  #, order: :position
  
end
