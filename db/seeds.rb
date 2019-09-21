# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
RESTAURANTS = [
 ["Pret A Manger", "24 Farringdon St", "EC4A 4AB", "https://i.pinimg.com/originals/12/1a/e0/121ae05c213b2c37522e7fde2f4d8263.jpg"],
 ["Chilango", "142 Fleet St", "EC4A 2DQ", "https://chilango.co.uk/wp-content/themes/wpbootstrap/img/logo/chilangoLogoCircle.svg"],
 ["itsu", "130 Fleet St", "EC4A 2BH", "https://www.afroditi.com/wp-content/uploads/2015/02/afroditi-retaildesign-itsu17.jpg"],
 ["Pure", "3 St Bride St", "EC4A 4AS", "https://www.pure.co.uk/wp-content/uploads/cropped-PURE_FAVICON_PLAIN-100.jpg"],
 ["Leon", "12 Ludgate Circus", "EC4M 7LQ", "https://image.isu.pub/141007162921-0065e5caf295d851ea489111dc67fa57/jpg/page_1.jpg"],
 ["Café Rouge", "14 St. Paul's Churchyard", "EC4M 8AY", "https://s3-media3.fl.yelpcdn.com/bphoto/asCExm9Lh18RdTJB7lw7Jw/o.jpg"],
 ["Obicà", "7 Limeburner Ln", "EC4M 7AX", "https://scontent-lhr3-1.xx.fbcdn.net/v/t1.0-9/38301047_1742384412542237_3383676485347835904_n.png?_nc_cat=108&_nc_oc=AQnLPHQoTkf72bgDsh98XNmb7gCmcQlyOxzXm8eDMwhefFO39Ah_DAvlDB4Z7_axFhk&_nc_ht=scontent-lhr3-1.xx&oh=b85822455d3aa57b33bb3206532a9fd5&oe=5DF76575"],
 ["Pizza Express", "1 New Fetter Ln", "EC4A 1AN", "https://upload.wikimedia.org/wikipedia/en/thumb/6/69/PizzaExpressBlack.svg/1200px-PizzaExpressBlack.svg.png"],
 ["Shot", "23 Bride Ln", "EC4Y 8DT", "https://static1.squarespace.com/static/58fb67823e00bec44d7a31fa/t/5b2a8f238a922d8f8040eb42/1568011706683/?format=1500w"],
 ["The Fable", "52 Holborn Viaduct", "EC1A 2FD", "https://f3e6t7k9.stackpathcdn.com/wp-content/uploads/2014/03/fable.jpg"],
 ["Sushi Tetsu", "12 Jersusalem Passage", "EC1V 4JP", "https://lh5.googleusercontent.com/p/AF1QipOqQaK7kmw9N5Ow6J5VhlnkJ9RQLiqHdd6_9NTt=w408-h306-k-no"],
 ["Carluccio's", "12 Smithfield", "EC1A 9JR", "https://lh5.googleusercontent.com/p/AF1QipNQM86S24CGgQDkafSGoMOVxM8Hqkbj4Jed4-bL=w426-h240-k-no"],
 ["Ptooch", "63 Leather Ln", "EC1N 7UL", "https://lh5.googleusercontent.com/p/AF1QipM-iVFCuRIRUHN-ZnL2ChFP-Kgb6I0XEprK5aqm=w408-h306-k-no"],
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


