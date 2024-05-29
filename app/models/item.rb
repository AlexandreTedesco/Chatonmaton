# frozen_string_literal: true

class Item < ApplicationRecord
  has_one_attached :image
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :image, presence: true
end