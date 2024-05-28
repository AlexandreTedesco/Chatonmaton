# frozen_string_literal: true

class CartItemsController < ApplicationController
  before_action :set_cart, only: %i[create destroy]

  def create
    id = params[:item_id]
    @item = Item.find(id)
    @cart_item = CartItem.new(cart: @cart, item: @item)

    if @cart_item.save
      respond_to do |format|
        format.html { redirect_back fallback_location: root_path }
        format.turbo_stream
      end
      flash[:success] = "L'article a bien été ajouté au panier"
    else
      flash[:error] = "Impossible d'ajouter l'article au panier"
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    id = params[:id]
    @item = Item.find(id)
    @cart_item = CartItem.find_by(cart: @cart, item: @item)
    if @cart_item&.destroy
      flash[:success] = "L'article a bien été supprimé de votre panier"
    else
      flash[:error] = "Impossible de supprimer l'article du panier"
    end
    redirect_back fallback_location: root_path
  end

  private

  def set_cart
    @cart = create_or_retrieve_cart_current_user
  end
end
