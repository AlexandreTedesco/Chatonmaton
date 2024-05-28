# frozen_string_literal: true

class CartsController < ApplicationController
  def show
    @cart = create_or_retrieve_cart_current_user
    @total_price = total_price(@cart)
    puts "$$$$$$$$$$$$$$$#{services_charges(@cart)}"
  end
end
