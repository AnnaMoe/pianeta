
require 'open-uri'
require 'json'

puts "cleaning database..."
Booking.destroy_all
Planet.destroy_all
User.destroy_all
puts "database is clean"

puts "creating planets"

test_user = User.create(id: 1, email: "anna@planet.de", password: "foobar")

5.times do |i|
  puts "user #{test_user}"
  Planet.create(
    user: test_user,
    price: rand(100..500),
    name_of_space_station: Faker::TvShows::StarTrek.location,
    name_of_inhabitants: Faker::TvShows::StarTrek.specie,
    name_of_galaxy: Faker::Space.galaxy,
    title: Faker::Movies::StarWars.planet,
    host_name: Faker::TvShows::Stargate.character,
    description: "Longing for a planet with exotic nature and stunning waterfalls? This is the right place for you if you want to get a break from your busy urban lifestyle. There are more trees than inhabitants. Here you are really connected to the nature as you'd live in tree houses and listen to the flow of water whereever you are. It just doesn't feel, like another planet, IT IS another planet."
  )
end

puts "done"
