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

  describe 'instance methods' do
    describe '.number_of_recipes' do
      it 'returns a count of how many recipes an ingredient is used in' do
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
        expect(spices.number_of_recipes).to eq(2)
        expect(coconut_milk.number_of_recipes).to eq(1)
      end
    end
  end 
end
