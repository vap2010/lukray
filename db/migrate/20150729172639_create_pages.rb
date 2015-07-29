class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :parent_id
      t.integer :position
      t.boolean :is_deleted, :default => false
      t.boolean :is_published, :default => true
      t.boolean :is_shown_in_menu, :default => false
      t.boolean :is_preview_published, :default => false
      t.string :title
      t.string :menu_title
      t.text  :announce
      t.text  :body
      t.string :alias

      t.timestamps
    end
  end
end
