class Ingredient < ApplicationRecord
    validates_presence_of :name 
    validates_presence_of :cost

    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients

    def self.recipes_count
        hash_by_id = RecipeIngredient.group(:ingredient_id).count.sort.to_h

        hash_by_name = Hash.new 

        hash_by_id.each do |key, value| 
            hash_by_name[Ingredient.find(key).name] = value
        end 

        hash_by_name
    end

    def self.sort_alpha
        Ingredient.all.order(:name)
    end
end