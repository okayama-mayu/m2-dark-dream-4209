require 'rails_helper' 

RSpec.describe 'Recipes Index' do 
    # User Story 1 of 4
    # As a visitor,
    # When I visit '/recipes',
    # I see a list of recipes with the following information:
    # -Name
    # -Complexity
    # -Genre
    # (e.g. "Name: Spaghetti, Complexity: 2, Genre: Italian")

    it 'has a list of recipes with attributes' do 
        recipe1 = Recipe.create!(name: 'Spaghetti', complexity: 2, genre: 'Italian')
        recipe2 = Recipe.create!(name: 'Steak', complexity: 1, genre: 'American')
        recipe3 = Recipe.create!(name: 'Ramen', complexity: 4, genre: 'Japanese')

        visit '/recipes' 
        # save_and_open_page

        expect(page).to have_content 'Spaghetti'
        expect(page).to have_content 2
        expect(page).to have_content 'Italian'
        expect(page).to have_content 'Steak'
        expect(page).to have_content 1
        expect(page).to have_content 'American'
        expect(page).to have_content 'Ramen' 
        expect(page).to have_content 4
        expect(page).to have_content 'Japanese' 
    end
end