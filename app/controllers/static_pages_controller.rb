class StaticPagesController < ApplicationController

  def home
  	@all = Item.all

  	if user_signed_in?
  		mon_cart = Cart.create(user_id: current_user.id)

  	end
  end

  def profil

  end

end
