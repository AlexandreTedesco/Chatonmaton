# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

Item.destroy_all

10.times do
  Item.create!(
    title: Faker::Creature::Cat.name,
    description: Faker::Creature::Cat.registry,
    price: Faker::Commerce.price(range: 8.0..35.0),
    image: Faker::LoremFlickr.image(size: '300x300', search_terms: ['kitten'])
  )
end

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph(sentence_count: 3)
  )
end
