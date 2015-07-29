class CreateMetaTags < ActiveRecord::Migration
  def change
    create_table :meta_tags do |t|
      t.text :title
      t.text :description
      t.text :keywords
      t.string :url
      t.integer :metatagable_id,  :null => false
      t.string :metatagable_type, :null => false
      t.integer :skin_id
      t.boolean :no_cache,    :default => false
      t.boolean :noindex,     :default => false
      t.boolean :nofollow,    :default => false
      t.boolean :is_redirect, :default => false
      t.string  :redirect_uri
      t.integer :hits_count,  :default => 0

      t.timestamps
    end
  end
end
