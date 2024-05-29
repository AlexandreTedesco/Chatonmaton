# frozen_string_literal: true

class Item < ApplicationRecord
  has_one_attached :image
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :image, presence: true

  def display_image
    image.variant(resize_to_fill: [300, 300]).processed
  end
end
