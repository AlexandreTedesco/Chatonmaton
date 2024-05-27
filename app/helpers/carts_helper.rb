module CartsHelper
    def cart_current_user()
        return Cart.find_by(user: current_user)
    end
end
