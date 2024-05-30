# frozen_string_literal: true

module OrdersHelper
    def order_current_user()
        order = Order.find_by(user_id: current_user.id)
        puts "$$$$$$$$$$$$$$$$$$$$$#{order.cart}"
        cart = Cart.find(order.cart_id)
        return cart
    end
end
