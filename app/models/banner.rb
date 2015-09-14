class Banner < ActiveRecord::Base

  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  scope :actual,     -> { where(is_deleted: false)  }
  scope :published,  -> { actual.where(is_published: true) }

  scope :infoblocks, -> { published.where(category_id: 20).order(:position) }


end
