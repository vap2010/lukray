class Category < ActiveRecord::Base


  scope :actual,     -> { where(is_deleted: false)  }
  scope :isopen,     -> { actual.where(is_published: true) }

  scope :homesteads, -> { actual.isopen.where(type_id: 1).order(:position) }
  scope :page_skels, -> { actual.isopen.where(type_id: 2).order(:position) }
  scope :documents,  -> { actual.isopen.where(type_id: 3).order(:position) }
  scope :newsevents, -> { actual.isopen.where(type_id: 4).order(:position) }
  scope :picgallery, -> { actual.isopen.where(type_id: 5).order(:position) }
  scope :banners,    -> { actual.isopen.where(type_id: 6).order(:position) }
  scope :siteorders, -> { actual.isopen.where(type_id: 7).order(:position) }
  scope :bigvisuals, -> { actual.isopen.where(type_id: 8).order(:position) }

  scope :adm_homesteads, -> { actual.where(type_id: 1).order(:position) }
  scope :adm_page_skels, -> { actual.where(type_id: 2).order(:position) }
  scope :adm_documents,  -> { actual.where(type_id: 3).order(:position) }
  scope :adm_newsevents, -> { actual.where(type_id: 4).order(:position) }
  scope :adm_picgallery, -> { actual.where(type_id: 5).order(:position) }
  scope :adm_banners,    -> { actual.where(type_id: 6).order(:position) }
  scope :adm_siteorders, -> { actual.where(type_id: 7).order(:position) }
  scope :adm_bigvisuals, -> { actual.where(type_id: 8).order(:position) }

                             
  # Category.symtypes
  def self.symtypes
    [:bigvisuals, :homesteads, :siteorders, :page_skels, :documents, :newsevents, :picgallery, :banners]
  end

  # Category.symtypes
  def self.adm_symtypes
    [:adm_bigvisuals, :adm_homesteads, :adm_siteorders, :adm_page_skels, :adm_documents, :adm_newsevents, :adm_picgallery, :adm_banners] 
  end





end
