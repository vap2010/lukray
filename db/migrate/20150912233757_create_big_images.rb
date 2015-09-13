class CreateBigImages < ActiveRecord::Migration
  
  def up
    create_table :big_images do |t|
      t.integer :position
      t.boolean :is_public,  :default => true  
      t.boolean :is_deleted, :default => false 
      t.integer :category_id
      t.string :title
      t.string :params
      t.timestamps
    end
  end

  def down
    drop_table :big_images
  end  
  
end
