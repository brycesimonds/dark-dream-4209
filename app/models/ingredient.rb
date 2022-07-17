class Ingredient < ApplicationRecord
    validates_presence_of :name
    validates_presence_of :cost

    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients

    def number_of_recipes
        count_of_recipes_with_specific_ingredient = []
        RecipeIngredient.all.each do |recipe_ingredient|
            if recipe_ingredient.ingredient_id == id
                count_of_recipes_with_specific_ingredient << recipe_ingredient
            end
        end
        count_of_recipes_with_specific_ingredient.count
    end
end