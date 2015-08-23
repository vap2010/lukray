class AddScriptAfterToPages < ActiveRecord::Migration
  def change
    add_column :pages, :script_after, :string
  end
end
