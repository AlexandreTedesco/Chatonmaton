# frozen_string_literal: true

class OrdersController < ApplicationController

  def create
    authorize @order
    @stripe_amount = 500
    begin
      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken]
      })
      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @stripe_amount,
        description: "Achat d'un produit",
        currency: 'eur'
      })

      # Enregistrer la commande dans la base de données après le paiement réussi
      Order.create(
        user_id: current_user.id,
        cart_id: SecureRandom.uuid, # Générer un identifiant unique pour la commande
        stripe_session_id: charge.id
      )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_order_path
    end
  end
end
