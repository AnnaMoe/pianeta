
require 'open-uri'
require 'json'

puts "cleaning database..."
Planet.destroy_all
puts "database is clean"

5.times do |i|
  Planet.create(
    price: 4,
    title: "test",
    description: "test"
  )
end