# frozen_string_literal: true

class CartItemsController < ApplicationController
  def create
    id = params[:item_id]
    puts "$$$$$$$$$$$$$$$#{id}"
    @cart = Cart.find_by(user: current_user)
    puts "111111111111111#{@cart}"
    @item = Item.find(id)
    puts "222222222222#{@item}"
    @cart_item = CartItem.new(cart: @cart, item: @item)
    puts "33333333333#{@cart_item}"
    return unless @cart_item.save

    redirect_back(fallback_location: root_path)
    flash[:success] = "L'article a bien été ajouté au panier"
  end

  def destroy
    id = params[:id]
    @cart = Cart.find_by(user: current_user)
    @item = Item.find(id)
    @cart_item = CartItem.find_by(cart: @cart, item: @item)
    @cart_item.destroy
    redirect_back(fallback_location: root_path)
    flash[:success] = "L'article a bien été supprimé de votre panier"
  end
end
