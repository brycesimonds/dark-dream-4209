# Name: Bryce Simonds
## Reflection:
I felt pretty good about each user story, got through all 4. 

The part that took me longest was trying to figure out the AR method to count the number of recipes each ingredient is used in. I tried 'where' before and it wasn't working. Turns out I was in the wrong test, so that was funny.

I spent time on that, realized I could just get it to run with ruby then come back to it. So I did that, then finished and had time to refactor it trying the where again. Did some pry-ing and that's how I figured out my dilemma. 

Spent my remaining time trying to figure out a way to utilize AR for the 4th user story: 
When I visit '/recipes/:id'
I see the total cost of all of the ingredients in the recipe.

I'd love to hear you're thoughts/feedback on it. Thank you for all you do/are doing. I feel like I have learned so much and appreciate all the practice!
Cheers,
Bryce Simonds


# Hells Kitchen

Fork this repository and clone your newly created repository. 

## Be sure to read all user stories BEFORE beginning your work
---

## Setup

* Fork this repository
* Clone down your forked repository
* Perform the usual setup steps after cloning a Rails application:
  - `bundle install`
  - `rails db:{create,migrate,seed}`
---
### Submission

When you have completed this challenge, At the end of the challenge, DM all three instructors with your repository link. Include a reflection on how you felt you did with this challenge and what story you got through

---
### Requirements

* TDD all new work
* any model METHODS you write must be fully tested.
* any model RELATIONSHIPS you create must be fully tested.
---

### Not Required

* No visual styling is required or expected
* No model testing for validations are required
---

When you run rspec, you should have 11 failing tests to start.  

###  Overview

We will be creating an application to track recipes and ingredients at Hell's Kitchen. 

Recipes will have a name, complexity and genre. For example Pasta, 2 (integer), Italian.

Ingredients will have a name and a cost stored as an integer.

 
### User Stories
 
```
User Story 1 of 4
As a visitor,
When I visit '/recipes',
I see a list of recipes with the following information:
-Name
-Complexity
-Genre
(e.g. "Name: Spaghetti, Complexity: 2, Genre: Italian")
```
```
User Story 2 of 4
As a visitor,
When I visit '/recipes/:id'
I see a list of the names of the ingredients the recipe has.
(e.g. "Pasta, Meat, Cheese")
```
```
User Story 3 of 4
As a visitor,
When I visit '/ingredients'
I see a list of ingredients and the number of recipes each ingredient is used in.
(e.g. "Ground Beef: 2"
     "Salt: 4")
```
```
User Story 4 of 4
As a visitor,
When I visit '/recipes/:id'
I see the total cost of all of the ingredients in the recipe.
(e.g. "Total Cost: 22")
```
---
### Extension
```
User Story Extension
On all index pages, all information is listed alphabetically.
	

