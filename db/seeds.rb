# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Flat.destroy_all

puts "DB cleaned!"

user = User.create!(email: "dummy@gmail.com", password: "123456")

puts "user #{user.email} created"
5.times do
  Flat.create!(
    title: Faker::Artist.name,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    address: Faker::Address.street_address,
    capacity: rand(1...5),
    price: rand(50...500),
    user_id: user.id
  )
end

puts "#{Flat.all.count} flats created"
