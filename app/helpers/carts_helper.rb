# frozen_string_literal: true

module CartsHelper
    def create_or_retrieve_cart_current_user
      cart = Cart.find_by(user: current_user)
      return cart if cart

      Cart.create(user: current_user)
    end

    def total_price(cart)
      total_price = 0
      cart.items.each do |item|
        total_price += item.price
      end
      total_price
    end

    def services_charges(cart)
      total_price(cart) * 0.04
    end
  end
