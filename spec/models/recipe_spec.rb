require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe 'instance methods' do 
    it 'returns the cost of the recipe' do 
      recipe1 = Recipe.create!(name: 'Spaghetti', complexity: 2, genre: 'Italian')

      ingredient1 = Ingredient.create!(name: 'Pasta', cost: 2)
      ingredient2 = Ingredient.create!(name: 'Eggplant', cost: 3)
      ingredient3 = Ingredient.create!(name: 'Tomato sauce', cost: 5)
      ingredient5 = Ingredient.create!(name: "Salt", cost: 4)


      RecipeIngredient.create!(recipe: recipe1, ingredient: ingredient1)
      RecipeIngredient.create!(recipe: recipe1, ingredient: ingredient2)
      RecipeIngredient.create!(recipe: recipe1, ingredient: ingredient3)
      RecipeIngredient.create!(recipe: recipe1, ingredient: ingredient5)

      expect(recipe1.total_cost).to eq 14
    end
  end
end
