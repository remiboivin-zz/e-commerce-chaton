class ItemsController < ApplicationController
  # before_action :set_item, only: [:show]

  def index
  end

  def show
  	@id_item_detail = Item.find(params[:id_item_detail])
  	@id_to_send = params[:id_item_detail]
  	@item = Item.find(params[:id_item_detail])
  end

  def add
  	@id_item = params[:id_item_to_add].to_i
  	@item = Item.find(@id_item)

  	mon_ajout = Store.new(cart_id: Cart.find_by(user_id: current_user.id).id, item_id: @item.id)
  	mon_ajout.save

  	# redirect_to "/item/#{@id_item}"
  	redirect_to "/"
  end

# private

# 	def set_item
# 		@item = Item.find(params[:id])
# 	end

end
