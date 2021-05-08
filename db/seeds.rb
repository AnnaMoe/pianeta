
require 'open-uri'
require 'json'

def create_planet(u, desc)
  Planet.create(
    user: u,
    price: rand(100..500),
    name_of_space_station: Faker::TvShows::StarTrek.location,
    name_of_inhabitants: Faker::TvShows::StarTrek.specie,
    name_of_galaxy: Faker::Space.galaxy,
    title: Faker::Movies::StarWars.planet,
    host_name: Faker::TvShows::Stargate.character,
    description: desc
  )
end

def  add_image_to_planet(p, image_name)
  image = File.open("db/pictures/#{image_name}")
  extension = image_name.split('.').last

  p.photos.attach(io: image, filename: image_name, content_type: "image/#{extension}")
end

puts "cleaning database..."
Booking.destroy_all
Planet.destroy_all
User.destroy_all
puts "database is clean"

puts "creating planets"

test_user = User.create(id: 1, email: "anna@planet.de", password: "foobar")

images = ['houses.png', 'treehouses.png', 'iglus.png', 'waterfall.png', 'path.png', 'river.png', 'waterfall2.png', 'lake.jpg', 'tree.jpg', 'night-sky.jpg', 'desert.jpg']

# create random planets
9.times do |i|
  puts "user #{test_user}"
  p = create_planet(test_user, Faker::Lorem.paragraph)

  5.times do |j|
    image_name = images.sample
    add_image_to_planet(p, image_name)
  end
end

# create pre-defined content
p1_description = "Longing for a planet with exotic nature and stunning waterfalls? This is the right place for you if you want to get a break from your busy urban lifestyle. There are more trees than inhabitants. Here you are really connected to the nature as you'd live in treehouses and listen to the flow of water whereever you are. It just doesn't feel, like another planet, IT IS another planet."
p_unique_images = ['treehouses.png', 'river.png', 'waterfall2.png', 'tree.jpg', 'lake.jpg']

p_unique = create_planet(test_user, p1_description)
5.times do |j|
  image_name = p_unique_images[j]
  add_image_to_planet(p_unique, image_name)
end

puts "done"
