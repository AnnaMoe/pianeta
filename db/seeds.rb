
require 'open-uri'
require 'json'

puts "cleaning database..."
Planet.destroy_all
puts "database is clean"

test_user = User.create(email: "anna@planet.de", password: "foobar")

5.times do |i|
  Planet.create(
    user: test_user,
    price: 4,
    title: "test",
    description: "test"
  )
end