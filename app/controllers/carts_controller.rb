# frozen_string_literal: true
class CartsController < ApplicationController
  def show
    @cart = create_or_retrieve_cart_current_user
  end

  private

  def create_or_retrieve_cart_current_user
    current_user.cart || current_user.create_cart
  end
end
