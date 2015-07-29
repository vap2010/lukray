class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.string :alias
      t.integer :weight

      t.timestamps
    end
  end
end
