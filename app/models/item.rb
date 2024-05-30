# frozen_string_literal: true

class Item < ApplicationRecord
  has_one_attached :image
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validate :either_image_or_image_url_present

  def either_image_or_image_url_present
    if image.blank? && image_url.blank?
      errors.add(:base, "Please provide either an image or an image URL")
    elsif !image.blank? && !image_url.blank?
      errors.add(:base, "Please provide either an image or an image URL, not both")
    end
  end
end
