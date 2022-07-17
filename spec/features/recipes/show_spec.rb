require 'rails_helper'

RSpec.describe "recipes show page", type: :feature do 
    it 'has a all of the recipes ingredients listed' do

    spaghetti = Recipe.create!(name: "spaghetti", complexity: 2, genre: "italian")
    grain_pasta = Ingredient.create!(name: "grain pasta", cost: 3)
    red_sauce = Ingredient.create!(name: "red sauce", cost: 5)
    olive_oil = Ingredient.create!(name: "olive oil", cost: 20)
    RecipeIngredient.create!(recipe: spaghetti, ingredient: grain_pasta)
    RecipeIngredient.create!(recipe: spaghetti, ingredient: red_sauce)
    RecipeIngredient.create!(recipe: spaghetti, ingredient: olive_oil)

    curry = Recipe.create!(name: "curry", complexity: 4, genre: "thai")
    coconut_milk = Ingredient.create!(name: "coconut milk", cost: 6)
    spices = Ingredient.create!(name: "spices", cost: 8)
    garlic = Ingredient.create!(name: "garlic", cost: 1)
    RecipeIngredient.create!(recipe: curry, ingredient: coconut_milk)
    RecipeIngredient.create!(recipe: curry, ingredient: spices)
    RecipeIngredient.create!(recipe: curry, ingredient: garlic)

    visit "/recipes/#{spaghetti.id}"

    expect(page).to have_content("grain pasta")
    expect(page).to have_content("red sauce")
    expect(page).to have_content("olive oil")

    expect(page).to_not have_content("coconut milk")
    expect(page).to_not have_content("spices")
    expect(page).to_not have_content("garlic")
    end 

    it 'has a total cost of all the ingredients listed in the spaghetti recipe' do

    spaghetti = Recipe.create!(name: "spaghetti", complexity: 2, genre: "italian")
    grain_pasta = Ingredient.create!(name: "grain pasta", cost: 3)
    red_sauce = Ingredient.create!(name: "red sauce", cost: 5)
    olive_oil = Ingredient.create!(name: "olive oil", cost: 20)
    RecipeIngredient.create!(recipe: spaghetti, ingredient: grain_pasta)
    RecipeIngredient.create!(recipe: spaghetti, ingredient: red_sauce)
    RecipeIngredient.create!(recipe: spaghetti, ingredient: olive_oil)

    visit "/recipes/#{spaghetti.id}"

    within "#total_cost" do 
        expect(page).to have_content("Total cost of ingredients in this recipe is:")
        expect(page).to have_content(28)
    end 
    end 

    it 'has a total cost of all the ingredients listed in the curry recipe' do

    curry = Recipe.create!(name: "curry", complexity: 4, genre: "thai")
    coconut_milk = Ingredient.create!(name: "coconut milk", cost: 6)
    spices = Ingredient.create!(name: "spices", cost: 8)
    garlic = Ingredient.create!(name: "garlic", cost: 1)
    RecipeIngredient.create!(recipe: curry, ingredient: coconut_milk)
    RecipeIngredient.create!(recipe: curry, ingredient: spices)
    RecipeIngredient.create!(recipe: curry, ingredient: garlic)

    visit "/recipes/#{curry.id}"

    within "#total_cost" do 
        expect(page).to have_content("Total cost of ingredients in this recipe is:")
        expect(page).to have_content(15)
    end 
    end 
end