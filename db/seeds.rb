# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Seed start'

User.destroy_all

counter = 0

5.times do
  newUser = User.create!(email: "user#{counter}@mango.com", password: 'secret')
  counter += 1
end

puts 'Seed end'
