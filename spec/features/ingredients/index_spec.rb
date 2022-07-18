require 'rails_helper' 

RSpec.describe 'Ingredients Index' do 
    # User Story 3 of 4
    # As a visitor,
    # When I visit '/ingredients'
    # I see a list of ingredients and the number of recipes each ingredient is used in.
    # (e.g. "Ground Beef: 2", "Salt: 4")
    it 'has a list of ingreidents and the number of recipes each ingredient is used in' do 
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

        visit '/ingredients'
        # save_and_open_page

        expect(page).to have_content('Pasta: 1')
        expect(page).to have_content('Eggplant: 2')
        expect(page).to have_content('Tomato sauce: 2')
        expect(page).to have_content('Prime rib: 1')
        expect(page).to have_content('Salt: 3')
    end

    it 'lists all ingredients in alphabetical order' do 
        ingredient1 = Ingredient.create!(name: 'Pasta', cost: 2) #1
        ingredient2 = Ingredient.create!(name: 'Eggplant', cost: 3) #2
        ingredient3 = Ingredient.create!(name: 'Tomato sauce', cost: 5) #2

        visit '/ingredients' 

        within "#ingredient-0" do
            expect(page).to have_content('Eggplant')
        end

        within "#ingredient-1" do
            expect(page).to have_content('Pasta')
        end

        within "#ingredient-2" do
            expect(page).to have_content('Tomato Sauce')
        end
    end
end