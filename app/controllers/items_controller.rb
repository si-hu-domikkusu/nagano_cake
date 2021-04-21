class ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_items = CartItem.new
  end
end
