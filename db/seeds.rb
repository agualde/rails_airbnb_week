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
photos = [
  'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YXBhcnRtZW50fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1515263487990-61b07816b324?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXBhcnRtZW50fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YXBhcnRtZW50fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1502672023488-70e25813eb80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8YXBhcnRtZW50fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1536376072261-38c75010e6c9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGFwYXJ0bWVudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1494475673543-6a6a27143fc8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8ZmxhdCUyMGJ1aWxkaW5nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1566195992011-5f6b21e539aa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGZsYXQlMjBidWlsZGluZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1580237072617-771c3ecc4a24?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGZsYXQlMjBidWlsZGluZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1502672023488-70e25813eb80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8YXBhcnRtZW50fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1479705879471-5afa19ebdcc5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZmxhdCUyMGJ1aWxkaW5nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
]

puts "user #{user.email} created"

5.times do
  flat = Flat.create!(
  title: Faker::Artist.name,
  description: Faker::Lorem.paragraph(sentence_count: 12),
  address: Faker::Address.street_address,
  capacity: rand(1...5),
  price: rand(50...500),
  accept_pets: [true, false].sample,
  air_con: [true, false].sample,
  smoker_friendly: [true, false].sample,
  wifi: [true, false].sample,
  parking: [true, false].sample,
  pool_access: [true, false].sample,
  tv: [true, false].sample,
  washer: [true, false].sample,
  luggage_drop_off: [true, false].sample,
  balcony: [true, false].sample,
  user_id: user.id,
  rooms: 1
  )

  file1 = URI.open(photos.sample)
  file2 = URI.open(photos.sample)
  file3 = URI.open(photos.sample)
  file4 = URI.open(photos.sample)
  file5 = URI.open(photos.sample)

  flat.photos.attach([{ io: file1, filename: flat.title, content_type: 'image/jpeg' },
                      { io: file2, filename: flat.title, content_type: 'image/jpeg' },
                      { io: file3, filename: flat.title, content_type: 'image/jpeg' },
                      { io: file4, filename: flat.title, content_type: 'image/jpeg' },
                      { io: file5, filename: flat.title, content_type: 'image/jpeg' }])
end
puts "#{Flat.all.count} flats created"
