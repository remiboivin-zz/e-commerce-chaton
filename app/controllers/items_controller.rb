class ItemsController < ApplicationController

  def index
  end

  def show
    @item = Item.find(params[:item_id])
  end

  def add
    @id_item = params[:item_id].to_i
    @item = Item.find(@id_item)

    mon_ajout = Store.new(cart_id: Cart.find_by(user_id: current_user.id).id, item_id: @item.id)
    mon_ajout.save
    redirect_to root_path
  end

end
