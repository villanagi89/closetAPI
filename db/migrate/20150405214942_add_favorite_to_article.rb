class AddFavoriteToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :favorite, :boolean, default: false
  end
end
