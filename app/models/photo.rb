class Photo < ActiveRecord::Base
  has_attached_file :image
  has_attached_file :preview
  validates_attachment_content_type :preview, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  scope :actual,     -> { where(is_deleted: false)  }
  scope :published,  -> { actual.where(is_published: true) }
  
end
