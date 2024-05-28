# frozen_string_literal: true

class User < ApplicationRecord
  after_create :welcome_send
  has_one :cart

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def create_cart
    Cart.create(user: self)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
