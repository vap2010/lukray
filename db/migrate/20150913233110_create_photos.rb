class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :position
      t.integer :category_id
      t.boolean :is_deleted, :default => false
      t.boolean :is_published, :default => true
      t.boolean :is_shown_in_menu, :default => true
      t.boolean :is_preview_published, :default => true
      t.integer :skin_id
      t.string :title
      t.string :menu_title
      t.text :announce
      t.text :body
      t.attachment :preview
      t.attachment :image

      t.timestamps
    end
  end
end
