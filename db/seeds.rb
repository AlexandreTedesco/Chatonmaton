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
