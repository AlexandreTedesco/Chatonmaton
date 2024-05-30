# frozen_string_literal: true

require 'faker'
require 'httparty'

# Supprimer les enregistrements des tables dépendantes
CartItem.destroy_all
Cart.destroy_all
Order.destroy_all

# Supprimer les enregistrements principaux
Item.destroy_all
User.destroy_all

# Méthode pour obtenir une image de chat depuis The Cat API
def fetch_cat_image_url
  response = HTTParty.get('https://api.thecatapi.com/v1/images/search', headers: {
    'x-api-key' => 'live_fpDKqlZCkKrcC1qUKxpG91n7xFhmP07dh8t3LePbUjSlXzBi1krTMGsTXwVjukmY' # Remplacez par votre clé API The Cat API
  })
  if response.success?
    response.parsed_response[0]['url']
  else
    nil
  end
end

# Créer des items avec des images de chats aléatoires
10.times do
  image_url = fetch_cat_image_url

  # Assurez-vous que l'image URL n'est pas vide
  if image_url.present?
    Item.create!(
      title: Faker::Creature::Cat.name,
      description: Faker::Creature::Cat.registry,
      price: Faker::Commerce.price(range: 8.0..35.0),
      image_url: image_url
    )
  else
    puts "Image URL is blank, skipping item creation."
  end
end

# Créer des utilisateurs
10.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph(sentence_count: 3)
  )
end

   User.create!(
  email: 'admin@gmail.com',
  password: 'admin123',
  first_name: 'Admin',
  last_name: 'User',
  description: 'Administrateur de l\'application',
  admin: true # Définir cet utilisateur comme administrateur
)
puts "seed completed"
