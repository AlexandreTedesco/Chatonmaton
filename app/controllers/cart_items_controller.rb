class CartItemsController < ApplicationController
    def create()
        id = params[:item_id]
        @cart = Cart.find_by(user: current_user)
        @item = Item.find(id)
        @cart_item = CartItem.new(cart: @cart, item: @item)
        if @cart_item.save
          redirect_back(fallback_location: root_path)
          flash[:success] = "L'article a bien été ajouté au panier" 
        end
    end

    def destroy()
        id = params[:item_id]
        @cart = Cart.find_by(user: current_user)
        @item = Item.find(id)
        @cart_item = CartItem.find_by(cart: @cart, item: @item)
        @cart_item.destroy
        redirect_back(fallback_location: root_path)
        flash[:success] = "L'article a bien été supprimé de votre panier"
    end
end
