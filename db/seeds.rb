# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
RESTAURANTS = [
 ["Pret A Manger", "24 Farringdon St", "EC4A 4AB", "https://i.pinimg.com/originals/12/1a/e0/121ae05c213b2c37522e7fde2f4d8263.jpg"],
 ["Pure", "3 St Bride St", "EC4A 4AS", "https://www.pure.co.uk/wp-content/uploads/cropped-PURE_FAVICON_PLAIN-100.jpg"],
 ["Leon", "12 Ludgate Circus", "EC4M 7LQ", "https://image.isu.pub/141007162921-0065e5caf295d851ea489111dc67fa57/jpg/page_1.jpg"],
 #["Shot", "23 Bride Ln", "EC4Y 8DT"],
 ["Beboz Italian Street Food", "60C Holborn Viaduct", "EC1A 2FD", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3dNYGeGkD1RCAdxSSJNzt2jK_l8PzbuoPQqbzDyTS6gI2LcMS"],
 #["The Fable", "52 Holborn Viaduct", "EC1A 2FD"],
 ["Vivat Bacchus", "47 Farringdon St", "EC4A 4LL", "https://scontent-lhr3-1.xx.fbcdn.net/v/t1.0-9/10599543_10154640129505158_8096655893224581267_n.jpg?_nc_cat=100&_nc_oc=AQkSEyPoq7uxBzPBhgeoevIWcVw2eKq2JrV7Wh6F2Ngo-5JlXHr4L7mKEM4qyDMk5IQ&_nc_ht=scontent-lhr3-1.xx&oh=493edadd7f4ab2c5b0912383b5dd95d8&oe=5E3CAD54"],
 ["City Of London Distillery", "22-24 Bride Ln", "EC4Y 8DT", "https://halewood-int.com/wp-content/uploads/2017/09/logo-cold.jpg"],
 ["McDonald's", "152/153 Fleet St", "EC4A 2DQ", "https://miro.medium.com/max/2000/1*sszpZOih_xJV_lZsDbog-Q.png"],
 ["Ye Olde Cheshire Cheese", "145 Fleet St", "EC4A 2BU", "https://static.standard.co.uk/s3fs-public/thumbnails/image/2017/12/11/11/cheshire-cheese.jpg?w968"]
]

USERS = [
  ["Bob", "Dylan", "bd@mango.com", "MossyRock", 78, 5],
  ["Gregory", "Damsel", "greg@mango.com", "NotARobot", 28, 3],
  ["Alex", "Stones", "amstones@mango.com", "MangoMan123", 25, 4],
  ["Mickey", "Mouse", "icravecheddar@mango.com", "EmperorMickster", 91, 2]
]



def restaurant_creator(nested_array)
  nested_array.each do |restaurant|
    newRestaurant = Restaurant.create!(name: restaurant[0], address: "#{restaurant[1]}, London", photo: restaurant[3])
  end
end

require 'geocoder'
require 'faker'

puts 'Seed start'

Meeting.destroy_all
User.destroy_all
Restaurant.destroy_all


Faker::Internet.unique.clear

counter = 0
Faker::Config.locale = 'en-GB'

5.times do
  newUser = User.create!(email: "user#{counter}@mango.com", password: 'secret', username: Faker::Internet.unique.username)
  counter += 1
end

USERS.each do |user|
  newUser = User.create!(first_name: user[0], last_name: user[1], email: user[2], username: user[3], age: user[4], rating: user[5], password: 'secret')
end
restaurant_creator(RESTAURANTS)



puts 'Seed end'


