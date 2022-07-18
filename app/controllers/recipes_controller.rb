class RecipesController < ApplicationController
    def index
        @recipes = Recipe.sort_alpha
    end

    def show
        @recipe = Recipe.find(params[:id])
        @ingredients = @recipe.ingredients
        @cost = @recipe.total_cost
    end
end