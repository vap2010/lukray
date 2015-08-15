class Page < ActiveRecord::Base
  include Metatagable
  
  belongs_to :parent, class_name: 'Page'
  has_many :children, class_name: 'Page', foreign_key: :parent_id, dependent: :destroy  #, order: :position

  scope :published,   -> { where(:is_deleted => false).where(:is_published => true) }  
  scope :menu_points, -> { published.where(:is_shown_in_menu => true).order(:position) }  



  def url
    if self.meta_tag and !self.meta_tag.url.blank?
      "/#{self.meta_tag.url.to_s}.html"
    else  
      "/main/page/#{self.id}"
    end
  end

  def am_i_published?
    self.is_published and ! self.is_deleted 
  end

  def is_announce_view?
    self.am_i_published? and self.is_preview_published and ! self.announce.gsub(/\s/,'').blank?
  end

  def am_i_in_menu_published?
    self.is_shown_in_menu and self.am_i_published?   
  end

  def skin
    if self.meta_tag
      self.meta_tag.skin
    end
  end

  def find_toppage
    if self.parent 
      self.parent.find_toppage
    else
      self
    end  
  end

  def self.top_menu_aliases
    ['main', 'about', 'plan', 'place', 'infro', 'nature', 'around',
     'price', 'contact', 'photo', 'sale', 'services']
  end

  # scope :konkurs,      -> (time1, time2) { konkurs_valid(time1, time2).konkurs_period(time1, time2).not_banned.this_not_banned }  
end
