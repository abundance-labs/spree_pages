class AddLiveToSpreePages < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_pages, :live, :boolean, default: true
  end
end
