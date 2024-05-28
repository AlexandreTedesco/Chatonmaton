# frozen_string_literal: true

module CartsHelper
<<<<<<< HEAD
  def create_or_retrieve_cart_current_user
    cart = Cart.find_by(user_id: current_user.id)
    return cart if cart

    Cart.create(user_id: current_user.id)
  end
=======
    def create_or_retrieve_cart_current_user()
        cart = Cart.find_by(user: current_user)
        if cart
            return cart
        else
            return Cart.create(user: current_user)
        end
    end
>>>>>>> master
end
