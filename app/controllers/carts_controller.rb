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
      @cart_id = Cart.find_by(user_id: @id_user).id

    	@name_user = current_user.email
      num_cart = Cart.find_by(user_id: @id_user)
      @cart = Store.where(cart_id: num_cart.id)

      @prix_total_panier = 0
      @cart.each do |i|
        @prix_total_panier += Item.find(i.item_id).price.to_i+ "0.#{Item.find(i.item_id).price.split(",")[1]}".to_f
      end
    end
  end

  def pay
    @prix_total_to_pay = params[:money]


    @prix_total_float = "#{@prix_total_to_pay.to_i},#{@prix_total_to_pay.to_s.split(".")[1]}"

    if user_signed_in?
      Order.create(user_id: current_user.id, prix_total: @prix_total_to_pay)

      # vide le panier

      Store.where(cart_id: Cart.find_by(user_id: current_user.id)).each do |i|
        i.destroy
      end
    end
  end

end
