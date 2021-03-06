class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :spree_pages do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.text :content, null: false

      t.timestamps
    end

    add_index :spree_pages, :slug, unique: true
  end
end
