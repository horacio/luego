class AddFieldsToPage < ActiveRecord::Migration
  def change
    add_column :pages, :body, :text
    add_column :pages, :title, :string
  end
end
