class EnableLinkArchiving < ActiveRecord::Migration
  def change
    add_column :links, :archived, :boolean, default: false
  end
end
