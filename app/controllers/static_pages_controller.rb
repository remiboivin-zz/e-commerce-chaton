class StaticPagesController < ApplicationController

  def home
  	@all = Item.all

  	if user_signed_in?
  		mon_cart = Cart.create(user_id: current_user.id)

  	end
  end

  def profil
  	# if user_signed_in?
  	# 	@id_user = current_user.id
  	# 	@order_id = Order.where(user_id: @id_user)

  	# 	@order = 
  	# end
  end

end
