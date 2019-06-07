# frozen_string_literal: true

module Api
  module V1
    class FavoriteRecipesController < ApplicationController
      before_action :authorize_access_request!
      before_action :set_favorite_recipe, only: %i[show update destroy]

      # GET /favorite_recipes
      def index
        @favorite_recipes = current_user.favorite_recipes

        render json: @favorite_recipes
      end

      # GET /favorite_recipes/1
      def show
        render json: @favorite_recipe
      end

      # POST /favorite_recipes
      def create
        puts favorite_recipe_params
        @favorite_recipe = current_user.favorite_recipes.build(favorite_recipe_params)

        if @favorite_recipe.save
          render json: @favorite_recipe, status: :created
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
        @favorite_recipe = current_user.favorite_recipes.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def favorite_recipe_params
        params.require(:favorite_recipe).permit(:type, :recipe_id, :name, :instructions, :ingredients, :url, :image, :upvotes)
      end
    end
  end
end
