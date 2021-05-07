
require 'open-uri'
require 'json'

puts "cleaning database..."
Booking.destroy_all
Planet.destroy_all
User.destroy_all
puts "database is clean"

puts "creating planets"

test_user = User.create(id: 1, email: "anna@planet.de", password: "foobar")

images = ['houses.png', 'treehouses.png', 'iglus.png', 'waterfall.png', 'path.png', 'river.png', 'waterfall2.png']

10.times do |i|
  puts "user #{test_user}"
  p = Planet.create(
    user: test_user,
    price: rand(100..500),
    name_of_space_station: Faker::TvShows::StarTrek.location,
    name_of_inhabitants: Faker::TvShows::StarTrek.specie,
    name_of_galaxy: Faker::Space.galaxy,
    title: Faker::Movies::StarWars.planet,
    host_name: Faker::TvShows::Stargate.character,
    description: "Longing for a planet with exotic nature and stunning waterfalls? This is the right place for you if you want to get a break from your busy urban lifestyle. There are more trees than inhabitants. Here you are really connected to the nature as you'd live in tree houses and listen to the flow of water whereever you are. It just doesn't feel, like another planet, IT IS another planet."
  )

  5.times do |j|
    image_name = images.sample
    
    image = File.open("db/pictures/#{image_name}")
    extension = image_name.split('.').last
    

    p.photos.attach(io: image, filename: image_name, content_type: "image/#{extension}")
  end
end

puts "done"

# p1 = create_planet(test_user)
# p1.photos.attach(io: File.open("db/pictures/houses.png"), filename: 'houses.png', content_type: "image/png")
# p1.photos.attach(io: File.open("db/pictures/iglus.png"), filename: 'iglus.png', content_type: "image/png")
# p2 = create_planet(test_user)
# p3 = create_planet(test_user)

# def create_planet(u)
#   Planet.create(
#     user: test_user,
#     price: rand(100..500),
#     name_of_space_station: Faker::TvShows::StarTrek.location,
#     name_of_inhabitants: Faker::TvShows::StarTrek.specie,
#     name_of_galaxy: Faker::Space.galaxy,
#     title: Faker::Movies::StarWars.planet,
#     host_name: Faker::TvShows::Stargate.character,
#     description: "Longing for a planet with exotic nature and stunning waterfalls? This is the right place for you if you want to get a break from your busy urban lifestyle. There are more trees than inhabitants. Here you are really connected to the nature as you'd live in tree houses and listen to the flow of water whereever you are. It just doesn't feel, like another planet, IT IS another planet."
#   )
# end