class AddFewFielfsToHomesteads < ActiveRecord::Migration
  def change
    add_column :homesteads, :coords, :string
    add_column :homesteads, :show_on_map,            :boolean, :default => true
    add_column :homesteads, :show_but_add_compare,   :boolean, :default => true
    add_column :homesteads, :show_but_demonstrate,   :boolean, :default => true
    add_column :homesteads, :show_but_auction,       :boolean, :default => false
    add_column :homesteads, :show_but_booking,       :boolean, :default => true
  end
end
