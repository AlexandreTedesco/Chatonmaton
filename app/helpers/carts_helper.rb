module CartsHelper
    def create_or_retrieve_cart_current_user()
        cart = Cart.find_by(user: current_user)
        if cart
            return cart
        else
            cart = Cart.create(user: current_user)
        end
    end
end
