class IngredientsController < ApplicationController 
    def index
        @ingredients = Ingredient.all 
        @ingredient_count = Ingredient.recipes_count
    end
end