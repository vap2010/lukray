class Page < ActiveRecord::Base

  belongs_to :metatagable, :polymorphic => true

end
