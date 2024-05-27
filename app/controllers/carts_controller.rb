class CartsController < ApplicationController
    def show()
        @cart = create_or_retrieve_cart_current_user
    end
    
    # Pas sur je crois que ça sera lors de la connexion de l'utilisateur que le panier se créera
    # def create()
    #     @cart = Cart.create(user: current_user)
    # end
end