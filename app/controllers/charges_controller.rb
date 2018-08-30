class ChargesController < ApplicationController

def create
  # Amount in CENTS / CENTIMES
  @prix_total = Order.where(user_id: current_user.id).last.prix_total.to_i + "0.#{Order.where(user_id: current_user.id).last.prix_total.split(",")[1]}".to_f
  @amount = (@prix_total*100).to_i

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'carte de chatons',
    :currency    => 'EUR'
  )

  redirect_to :root

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to :root
end

end
