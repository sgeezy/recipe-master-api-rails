class AddColumnUserIdToFavoriteRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :favorite_recipes, :user_id, :integer
    add_foreign_key :favorite_recipes, :users
  end
end
