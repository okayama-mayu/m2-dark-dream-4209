require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :cost}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:recipes).through(:recipe_ingredients)}
  end

  describe 'class methods' do 
    it 'returns a hash of the ingredient as the key and the count as the value' do 
      recipe1 = Recipe.create!(name: 'Spaghetti', complexity: 2, genre: 'Italian')
        recipe2 = Recipe.create!(name: 'Steak with Eggplant', complexity: 1, genre: 'American')
        recipe3 = Recipe.create!(name: 'Special Soup', complexity: 4, genre: 'Soup')

        ingredient1 = Ingredient.create!(name: 'Pasta', cost: 2) #1
        ingredient2 = Ingredient.create!(name: 'Eggplant', cost: 3) #2
        ingredient3 = Ingredient.create!(name: 'Tomato sauce', cost: 5) #2
        ingredient4 = Ingredient.create!(name: "Prime rib", cost: 15) #1
        ingredient5 = Ingredient.create!(name: "Salt", cost: 4) #3

        RecipeIngredient.create!(recipe: recipe1, ingredient: ingredient1)
        RecipeIngredient.create!(recipe: recipe1, ingredient: ingredient2)
        RecipeIngredient.create!(recipe: recipe1, ingredient: ingredient3)
        RecipeIngredient.create!(recipe: recipe1, ingredient: ingredient5)

        RecipeIngredient.create!(recipe: recipe2, ingredient: ingredient2)
        RecipeIngredient.create!(recipe: recipe2, ingredient: ingredient4)
        RecipeIngredient.create!(recipe: recipe2, ingredient: ingredient5)

        RecipeIngredient.create!(recipe: recipe3, ingredient: ingredient3)
        RecipeIngredient.create!(recipe: recipe3, ingredient: ingredient5)

        expect(Ingredient.recipes_count).to eq({
          'Pasta' => 1,  
          'Eggplant' => 2, 
          'Tomato sauce' => 2, 
          'Prime rib' => 1, 
          'Tomato sauce' => 3
        })
    end
  end
end
