class DonationsController < ApplicationController
def new
end

def create
  # Amount in cents
  @amount = Float(params[:amount]) * 100

  customer = Stripe::Customer.create(
    email: params[:email],
    card: params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    customer: customer.id,
    amount: @amount.to_i,
    description: 'Donation',
    currency: 'usd'
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
end
end
