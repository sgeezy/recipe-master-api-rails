class CreateFavoriteRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_recipes do |t|
      t.integer :type
      t.integer :recipe_id
      t.string :name
      t.text :instructions
      t.text :ingredients
      t.string :url
      t.string :image
      t.integer :upvotes

      t.timestamps
    end
  end
end
