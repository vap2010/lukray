class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :position
      t.boolean :is_deleted,   :default => false
      t.boolean :is_published, :default => true
      t.integer :type_id
      t.string :title
      t.string :image
      t.text :text

      t.timestamps
    end
  end
end
