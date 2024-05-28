module CartsHelper
    def create_or_retrieve_cart_current_user()
        cart = Cart.find_by(user: current_user)
        if cart
            return cart
        else
            return Cart.create(user: current_user)
        end
    end

    def total_price(cart)
        total_price = 0
        cart.items.each do |item|
            total_price = total_price + item.price 
        end
        return total_price
    end
end
