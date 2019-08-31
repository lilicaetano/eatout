# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
RESTAURANTS = [
 ["Pret A Manger", "24 Farringdon St", "EC4A 4AB"],
 ["Pure", "3 St Bride St", "EC4A 4AS"],
 ["Leon", "12 Ludgate Circus", "EC4M 7LQ"],
 ["Shot", "23 Bride Ln", "EC4Y 8DT"],
 ["Beboz Italian Street Food", "60C Holborn Viaduct", "EC1A 2FD"],
 ["The Fable", "52 Holborn Viaduct", "EC1A 2FD"],
 ["Vivat Bacchus", "47 Farringdon St", "EC4A 4LL"],
 ["City Of  Distillery", "22-24 Bride Ln", "EC4Y 8DT"],
 ["McDonald's", "152/153 Fleet St", "EC4A 2DQ"],
 ["Ye Olde Cheshire Cheese", "145 Fleet St", "EC4A 2BU"]
]


def restaurant_creator(nested_array)
  nested_array.each do |restaurant|
    newRestaurant = Restaurant.create!(name: restaurant[0], address: "#{restaurant[1]}, London")
  end
end

require 'geocoder'
require 'faker'

puts 'Seed start'

User.destroy_all
Restaurant.destroy_all

Faker::Internet.unique.clear

counter = 0
Faker::Config.locale = 'en-GB'

5.times do
  newUser = User.create!(email: "user#{counter}@mango.com", password: 'secret', username: Faker::Internet.unique.username)
  counter += 1
end

restaurant_creator(RESTAURANTS)



puts 'Seed end'


