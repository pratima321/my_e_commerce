# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Pratima Mundhe', email: 'pratimamundhe2@gmail.com', mobile_number: '7498853360')

categories = Category.create([{ name: 'Biryanis', description: 'famous veg and nonveg hyderabadi biryanis' },
                              { name: 'Desserts And Beverages', description: 'Refreshing ice creams and drinks of summer' }, { name: 'Pizza', description: 'Amercian and Italion veg and non Pizza' }, { name: 'Recommended Items' }])

items = Item.create([
                      { name: 'Special Biryani', description: 'Tasty Biryani', item_price: '0.0',
                        category: categories.first }, { name: 'Scoop Of Vanilla Ice Cream', description: 'Scoop of vanilla ice cream topped with Chocolate Sauce', item_price: '150.0', category: categories.second }, { name: 'Kesari Gulab Jamun', description: 'The simply authentic Indian taste only cannot resist after a meal', item_price: '100.0', category: categories.second }, { name: '7 Up', description: 'Soft Drink', item_price: '80.0', category: categories.second }, { name: 'Mirinda', description: 'Soft Drink', item_price: '80.0', category: categories.second }, { name: 'Thrive Special Pizza', description: 'Cheesy Pizza Topped with fresh veggies and meat! Absolute delight for a cheese and meat lover', item_price: '250.0', category: categories.third }
                    ])

variations = Variation.create([{ name: 'Half', display_price: '250.0', item_price: '250.0', item: items.first },
                               { name: 'Full', display_price: '400.0', item_price: '400.0', item: items.first }, { name: 'Small', display_price: '250.0', item_price: '250.0', item: items.last }, { name: 'Medium', display_price: '400.0', item_price: '400.0', item: items.last }, { name: 'Large', display_price: '500.0', item_price: '500.0', item: items.last }])

Addon.create([{ name: 'Cheese', item: items.last, display_price: '0.0' },
              { name: 'Corn', item: items.last, display_price: '0.0' }, { name: 'Mushroom', item: items.last, display_price: '0.0' }, { name: 'Chicken Sausage', item: items.last, display_price: '75.0' }, { name: 'Double Meat', item: items.last, display_price: '100' }])
