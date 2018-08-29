class CartsController < ApplicationController
  def index
  end

  def edit
    @id_item_to_del = params[:id_item_to_del]

    @num_cart_user = Cart.find_by(user_id: current_user.id).id
    @tab = Store.where(cart_id: @num_cart_user)


    @tab.each_with_index do |i, nb|
      if "#{nb+1}" == @id_item_to_del
        i.destroy
      end
    end

    redirect_to "/carts/show"
  end


  def new
  end


  def show
    if user_signed_in?
      @id_user = current_user.id
      mon_cart = Cart.create(user_id: @id_user)
      @cart_id = Cart.find_by(user_id: @id_user).id

    	@name_user = current_user.email
      num_cart = Cart.find_by(user_id: @id_user)
      @cart = Store.where(cart_id: num_cart.id)
    end
  end

end
