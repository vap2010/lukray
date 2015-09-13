class AddTwoFieldsForPages < ActiveRecord::Migration
  def change
    add_column :pages, :script_for_eval, :string
    add_column :pages, :skin_id,         :integer 
  end
end
