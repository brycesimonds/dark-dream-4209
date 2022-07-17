require 'rails_helper'

RSpec.describe "recipes index page", type: :feature do 
    it 'has a list of ingredients' do
    spaghetti = Recipe.create!(name: "spaghetti", complexity: 2, genre: "italian")
    grain_pasta = spaghetti.ingredients.create!(name: "grain pasta", cost: 3)
    red_sauce = spaghetti.ingredients.create!(name: "red sauce", cost: 5)
    olive_oil = spaghetti.ingredients.create!(name: "olive oil", cost: 20)

    curry = Recipe.create!(name: "curry", complexity: 4, genre: "thai")
    coconut_milk = curry.ingredients.create!(name: "coconut milk", cost: 6)
    spices = curry.ingredients.create!(name: "spices", cost: 8)
    garlic = curry.ingredients.create!(name: "garlic", cost: 1)

    visit '/ingredients'

    expect(page).to have_content("grain pasta")
    expect(page).to have_content("red sauce")
    expect(page).to have_content("olive oil")
    expect(page).to have_content("coconut milk")
    expect(page).to have_content("spices")
    expect(page).to have_content("garlic")
    end 

    it 'includes the number of recipes each ingredient is used in' do
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

    burger = Recipe.create!(name: "burger", complexity: 1, genre: "american")
    RecipeIngredient.create!(recipe: burger, ingredient: red_sauce)
    RecipeIngredient.create!(recipe: burger, ingredient: spices)
    RecipeIngredient.create!(recipe: burger, ingredient: garlic)

    visit '/ingredients'

    within "#ingredients-#{grain_pasta.id}" do 
        expect(page).to have_content(1)
    end
    
    within "#ingredients-#{red_sauce.id}" do 
        expect(page).to have_content(2)
    end

    within "#ingredients-#{olive_oil.id}" do 
        expect(page).to have_content(1)
    end

    within "#ingredients-#{coconut_milk.id}" do 
        expect(page).to have_content(1)
    end

    within "#ingredients-#{spices.id}" do 
        expect(page).to have_content(2)
    end

    within "#ingredients-#{garlic.id}" do 
        expect(page).to have_content(2)
    end
  end 
end