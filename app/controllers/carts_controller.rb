class CartsController < ApplicationController
  def index
  end

  def edit
    tab = Store.where(cart_id: Cart.find_by(user_id: current_user.id).id)

    tab.each_with_index do |i, nb|
      if "#{nb+1}" == params[:item_id]
        i.destroy
      end
    end
    redirect_to 'carts_path(1)'
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

      @prix_total_panier_float = 0.0
      @item_prix_float = 0.0
      @cart.each do |i|
        @item_prix_float = Item.find(i.item_id).price.to_i+ "0.#{Item.find(i.item_id).price.split(",")[1]}".to_f
        @prix_total_panier_float += @item_prix_float
      end

      @prix_total_panier_float = @prix_total_panier_float.round(2)
      @prix_total_panier_string = "#{@prix_total_panier_float.to_i},#{@prix_total_panier_float.to_s.split(".")[1]}"
    end
  end

  def pay
    @to_pay_string = params[:money]
    @to_pay_float = "#{@to_pay_string.to_i}.#{@to_pay_string.split(",")[1]}".to_f
    if user_signed_in?
      Order.create(user_id: current_user.id, prix_total: @to_pay_string)
      UserMailer.contact.delivery_now
      # use delete_all instead of destroy on a loop
      Store.where(cart_id: Cart.find_by(user_id: current_user.id)).delete_all
    end
  end
end
