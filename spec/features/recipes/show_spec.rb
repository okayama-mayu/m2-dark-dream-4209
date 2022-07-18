require 'rails_helper' 

RSpec.describe 'Recipes Show' do 
    # User Story 2 of 4
    # As a visitor,
    # When I visit '/recipes/:id'
    # I see a list of the names of the ingredients the recipe has.
    # (e.g. "Pasta, Meat, Cheese")
    it 'has a list of the ingredients for a recipe' do 
        recipe1 = Recipe.create!(name: 'Spaghetti', complexity: 2, genre: 'Italian')
        recipe2 = Recipe.create!(name: 'Steak', complexity: 1, genre: 'American')

        ingredient1 = Ingredient.create!(name: 'Pasta', cost: 2)
        ingredient2 = Ingredient.create!(name: 'Eggplant', cost: 3)
        ingredient3 = Ingredient.create!(name: 'Tomato sauce', cost: 5)
        ingredient4 = Ingredient.create!(name: "Prime rib", cost: 15)
        ingredient5 = Ingredient.create!(name: "Salt", cost: 4)


        RecipeIngredient.create!(recipe: recipe1, ingredient: ingredient1)
        RecipeIngredient.create!(recipe: recipe1, ingredient: ingredient2)
        RecipeIngredient.create!(recipe: recipe1, ingredient: ingredient3)
        RecipeIngredient.create!(recipe: recipe1, ingredient: ingredient5)

        RecipeIngredient.create!(recipe: recipe2, ingredient: ingredient4)
        RecipeIngredient.create!(recipe: recipe2, ingredient: ingredient5)

        visit "/recipes/#{recipe1.id}"
        # save_and_open_page

        expect(page).to have_content 'Pasta'
        expect(page).to have_content 'Eggplant' 
        expect(page).to have_content 'Tomato sauce' 
        expect(page).to have_content 'Salt' 

        expect(page).to_not have_content 'Prime rib'
    end
end