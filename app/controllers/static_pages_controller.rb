class StaticPagesController < ApplicationController

  def home
  	@all = Item.all

  	if user_signed_in?
  		mon_cart = Cart.create(user_id: current_user.id)

  	end
  end

  def profil
      @id_user = current_user.id
      @order_id = Order.find_by(user_id: @id_user).id
      # @user_order_id = Order.find_by(user_id: @id_user)

      # @order = User.where(id: @user_order_id)
      @order = Order.where(user_id: current_user.id)
  end

end
