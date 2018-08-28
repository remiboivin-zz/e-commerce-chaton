class StaticPagesController < ApplicationController
  def home
    @all = Item.all
  end
end
