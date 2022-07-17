require 'rails_helper'

RSpec.describe "recipes index page", type: :feature do 
    it 'has a list of recipes with name, complexity, and genre' do

    spaghetti = Recipe.create!(name: "spaghetti", complexity: 2, genre: "italian")
    curry = Recipe.create!(name: "curry", complexity: 4, genre: "thai")
    burger = Recipe.create!(name: "burger", complexity: 1, genre: "american")

    visit '/recipes'

    expect(page).to have_content("spaghetti")
    expect(page).to have_content(2)
    expect(page).to have_content("italian")
    expect(page).to have_content("curry")
    expect(page).to have_content(4)
    expect(page).to have_content("thai")
    expect(page).to have_content("burger")
    expect(page).to have_content(1)
    expect(page).to have_content("american")
    end 
end