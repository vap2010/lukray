module Metatagable
  extend ActiveSupport::Concern

  included do
    has_one :meta_tag, :dependent => :delete, :as => :metatagable  #destroy
    accepts_nested_attributes_for :meta_tag
  end
end
