# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Create Users
require 'faker'
user1 = User.create!(
  email: "john.doe@example.com",
  password: 'password1', # Note: In a real app, ensure passwords are securely handled
  name: "John Doe",
  owner_mode: false
)

user2 = User.create!(
  email: "jane.smith@example.com",
  password: 'password2', # Note: In a real app, ensure passwords are securely handled
  name: "Jane Smith",
  owner_mode: false
)

# Create Flats
12.times do |i|
  Flat.create!(
    name: Faker::Address.community,
    address: Faker::Address.full_address,
    limit_guests: rand(1..10),
    photos: Faker::LoremFlickr.image(size: "300x300", search_terms: ['house', 'apartment']),
    price: rand(50..200),
    user_id: [user1.id, user2.id].sample, # Randomly assign to one of the two users
    description: Faker::Lorem.paragraph(sentence_count: 5)
  )
end
