# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

spaghetti = Recipe.create!(name: "spaghetti", complexity: 2, genre: "italian")
grain_pasta = spaghetti.ingredients.create!(name: "grain pasta", cost: 3)
red_sauce = spaghetti.ingredients.create!(name: "red sauce", cost: 5)
olive_oil = spaghetti.ingredients.create!(name: "olive oil", cost: 20)

curry = Recipe.create!(name: "curry", complexity: 4, genre: "thai")
coconut_milk = curry.ingredients.create!(name: "coconut milk", cost: 6)
spices = curry.ingredients.create!(name: "spices", cost: 8)
garlic = curry.ingredients.create!(name: "garlic", cost: 1)

burger = Recipe.create!(name: "burger", complexity: 1, genre: "american")


