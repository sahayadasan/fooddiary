# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
25.times do |i|
    Log.create!(
        date: Faker::Date.forward(10),
        category: ['Breakfast', 'Lunch', 'Dinner'].sample,
        name: Faker::Food.dish,
        servings: (0..9).to_a.sample,
        calories_per_serving: (100..500).to_a.sample
        )
end
