class AddAttachmentsToBigImages < ActiveRecord::Migration
  
  def up
    add_attachment :big_images, :preview
    add_attachment :big_images, :picture
  end

  def down
    remove_attachment :big_images, :preview
    remove_attachment :big_images, :picture
  end  
  
end
