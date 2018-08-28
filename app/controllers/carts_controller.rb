class CartsController < ApplicationController
  def index
  end

  def edit
  end

  def new
  end

  def show
  	  	@id_user = current_user.id
	mon_cart = Cart.create(user_id: @id_user)


  	@name_user = current_user.email

  	@cart = Cart.find_by(user_id: current_user.id)
  end
end


