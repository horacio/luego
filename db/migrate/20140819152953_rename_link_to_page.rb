class RenameLinkToPage < ActiveRecord::Migration
  def change
    rename_table :links, :pages
  end
end
