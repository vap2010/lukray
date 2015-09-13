class BigImage < ActiveRecord::Base

  # has_attached_file :preview, styles: { medium: "300x300>", thumb: "100x100>" }, 
  # default_url: "/images/:style/missing.png"
  
  has_attached_file :preview
  has_attached_file :picture
  validates_attachment_content_type :preview, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

  scope :actual,     -> { where(is_deleted: false)  }
  scope :published,  -> { actual.where(is_public: true) }






end
