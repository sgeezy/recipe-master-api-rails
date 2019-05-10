# frozen_string_literal: true

module API::V1
  class FavoriteRecipesController < ApplicationController
    before_action :set_favorite_recipe, only: %i[show update destroy]

    # GET /favorite_recipes
    def index
      @favorite_recipes = FavoriteRecipe.all

      render json: @favorite_recipes
    end

    # GET /favorite_recipes/1
    def show
      render json: @favorite_recipe
    end

    # POST /favorite_recipes
    def create
      @favorite_recipe = FavoriteRecipe.new(favorite_recipe_params)

      if @favorite_recipe.save
        render json: @favorite_recipe, status: :created, location: @favorite_recipe
      else
        render json: @favorite_recipe.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /favorite_recipes/1
    def update
      if @favorite_recipe.update(favorite_recipe_params)
        render json: @favorite_recipe
      else
        render json: @favorite_recipe.errors, status: :unprocessable_entity
      end
    end

    # DELETE /favorite_recipes/1
    def destroy
      @favorite_recipe.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_recipe
      @favorite_recipe = FavoriteRecipe.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def favorite_recipe_params
      params.require(:favorite_recipe).permit(:type, :recipe_id, :name, :instructions, :ingredients, :url, :image, :upvotes)
    end
  end
end
