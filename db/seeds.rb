# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
RESTAURANTS = [
 ["Pret A Manger", "24 Farringdon St", "EC4A 4AB", "https://media-cdn.tripadvisor.com/media/photo-s/15/8c/c5/7a/food-display-cabinet.jpg"],
 ["Chilango", "142 Fleet St", "EC4A 2DQ", "https://chilango.co.uk/wp-content/uploads/2015/02/Canon-mob.jpg"],
 ["itsu", "130 Fleet St", "EC4A 2BH", "https://media-cdn.tripadvisor.com/media/photo-s/0b/08/89/06/itsu-interni-del-locale.jpg"],
 ["Pure", "3 St Bride St", "EC4A 4AS", "https://www.pure.co.uk/wp-content/uploads/Pure32-1024x670.jpg"],
 ["Leon", "12 Ludgate Circus", "EC4M 7LQ", "https://image.isu.pub/141007162921-0065e5caf295d851ea489111dc67fa57/jpg/page_1.jpg"],
 ["Café Rouge", "14 St. Paul's Churchyard", "EC4M 8AY", "https://assets.hospitalitylinechristmas.co.uk/images/product/cafe-rouge-kingsway-christmas/kingsway-750x450.jpg"],
 ["Obicà", "7 Limeburner Ln", "EC4M 7AX", "https://assets-global.website-files.com/59baab33dea09c0001ac218f/59c1075da161ec000101ea2c_obica-mozzarella-bar-london-poland-street-01.jpg"],
 ["Pizza Express", "1 New Fetter Ln", "EC4A 1AN", "https://www.pizzaexpresslive.com/uploads/images/presets/gallery/Holborn/SWNS_PIZZA_EXPRESS_71.jpg"],
 ["The Fable", "52 Holborn Viaduct", "EC1A 2FD", "https://f3e6t7k9.stackpathcdn.com/wp-content/uploads/2014/03/fable.jpg"],
 ["Sushi Tetsu", "12 Jersusalem Passage", "EC1V 4JP", "https://lh5.googleusercontent.com/p/AF1QipOqQaK7kmw9N5Ow6J5VhlnkJ9RQLiqHdd6_9NTt=w408-h306-k-no"],
 ["Carluccio's", "12 Smithfield", "EC1A 9JR", "https://s3-eu-west-1.amazonaws.com/eu-static.bullring.co.uk/Live/ResizedImages/Grand%20Central/Retailer%20gallery%20images/1v1owitloaq/Gallery_Image/carluccios.jpg"],
 ["Ptooch", "63 Leather Ln", "EC1N 7UL", "https://fastly.4sqi.net/img/general/400x300/jOr4J6AcqHVbsAbQyomh6edWgpkyHlO7_jhKDDHw2pA.jpg"],
 ["Tas", "21 New Fetter Ln", "EC4A 3BF", "https://lh5.googleusercontent.com/p/AF1QipOykS3yJGKqg4g1ySeKtNQNL0i64b-sv93X3Z4L=w408-h284-k-no"],
 ["Holborn Dining Room", "252 High Holborn", "WC1V 7EN", "https://media.timeout.com/images/105249548/630/472/image.jpg"],
 ["Club Gascon", "57 W Smithfield", "EC1A 9DS", "https://lh5.googleusercontent.com/p/AF1QipPTu7WfmsMQTP9J0EXdx4apdtR1CUI_J7096Tyo=w408-h272-k-no"],
 ["Cozzo", "177 Whitecross St", "EC1Y 8QP", "https://lh3.googleusercontent.com/proxy/YIERhEoQAGxBbGf7HXOGzl2iRH-iF8rLfRbkdovXBOMjTliMKPq5P7bsQmUL5jyGbaNLo6XpTMoVjqncebXG10CMGAPvwa2cdtX--vhzK1dTzQcCaAeHa_5HnbWO3SFq3Pxt_8-n4quFD9NNXheIir7WAv45vSc=w442-h240-k-no"],
 ["Luca", "88 St John St", "EC1M 4EM", "https://lh5.googleusercontent.com/p/AF1QipOCZTkrZXA1SmDNi-ZlpT0etenAJtmeFirqnich=w408-h270-k-no"],
 ["L'Osteria", "57 Grays Inn Rd", "WC1X 8PP", "https://lh5.googleusercontent.com/p/AF1QipPWSESRsDG-1K71BJdfto7YZt6FX9TKBqRQ17K-=w408-h240-k-no-pi0-ya230.15982-ro-0-fo100"]
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


