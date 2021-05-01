
require 'open-uri'
require 'json'

puts "cleaning database..."
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
    title: Faker::Space.planet,
    description: Faker::Lorem.paragraphs
  )
end

puts "done"
