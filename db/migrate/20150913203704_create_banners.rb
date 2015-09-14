class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.integer :position
      t.integer :category_id
      t.boolean :is_deleted,   :default => false 
      t.boolean :is_published, :default => true  
      t.boolean :has_link,     :default => true  
      t.string :name
      t.string :title
      t.string :link
      t.text :text
      t.datetime :show_start
      t.datetime :show_end
      
      t.attachment :image

      t.timestamps
    end
  end
end
