class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :url
      t.integer :type
      t.integer :category
      t.belongs_to :closet, index: true

      t.timestamps null: false
    end
    add_foreign_key :articles, :closets
  end
end
