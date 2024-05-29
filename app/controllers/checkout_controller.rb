# frozen_string_literal: true

class CheckoutController < ApplicationController
  def create
    @total = params[:total].to_d
    @cart_id = params[:cart_id]
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          price_data: {
            currency: 'eur',
            unit_amount: (@total * 100).to_i,
            product_data: {
              name: 'Rails Stripe Checkout'
            }
          },
          quantity: 1
        }
      ],
      metadata: {
        cart_id: @cart_id
      },
      mode: 'payment',
      success_url: "#{checkout_success_url}?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: checkout_cancel_url
    )
    redirect_to @session.url, allow_other_host: true
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    @cart_id = @session.metadata.cart_id

    # Enregistrer la commande dans la base de données
    Order.create(
      user_id: current_user.id,
      cart_id: @cart_id,
      stripe_session_id: @session.id
    )
  end

  def cancel
    flash[:error] = 'Le paiement a été annulé ou a échoué.'

    # Rediriger l'utilisateur vers une page appropriée ou à l'endroit approprié de votre application
    redirect_to root_path
  end
end
