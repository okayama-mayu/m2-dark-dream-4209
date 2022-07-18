class Recipe < ApplicationRecord
    validates_presence_of :name
    validates_presence_of :complexity
    validates_presence_of :genre

    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    def total_cost
        ingredient_ids = Recipe.joins(:recipe_ingredients).first.ingredient_ids

        cost = 0 
        ingredient_ids.each do |id| 
            cost += Ingredient.find(id).cost
        end

        cost 
    end
end