class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.boolean :is_actual,  :defailt => true
      t.boolean :is_deleted, :defailt => false
      t.datetime :date
      t.integer :category_id
      t.integer :homestead_id
      t.string :name
      t.string :phone
      t.string :email
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
