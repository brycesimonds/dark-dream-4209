class Ingredient < ApplicationRecord
    validates_presence_of :name
    validates_presence_of :cost

    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients

    def number_of_recipes
        RecipeIngredient.where('ingredient_id = ?', "#{id}").count
    end
end