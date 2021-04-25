class ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(8)
    @item_amount = Item.count
    @genres = Genre.all
    @genre = 0
  end

  def show
    @item = Item.find(params[:id])
    @cart_items = CartItem.new
  end
end
