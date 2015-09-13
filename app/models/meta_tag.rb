class MetaTag < ActiveRecord::Base

  belongs_to :metatagable, :polymorphic => true
  validates :url, :presence => true  #, :uniqueness => true
  attr_accessor :is_hand_control


  scope :meta_no_edit,  where(:is_meta_no_edit => false)
  scope :meta_is_edit,  where(:is_meta_no_edit => true)

  scope :auto_control,  where(:is_hand_control => false)
  scope :hand_control,  where(:is_hand_control => true)

  scope :redirects,  where(:is_redirect => true)

  ##  MetaTag.hits_counts
  scope :hits_counts,  where('hits_count > 0')



end
