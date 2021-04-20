class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      flash[:notice] = "You have created item successfully."
      redirect_to admin_item_path(@item.id)
    else
    # @items = Item.all
     render :new
    end
  end

  def show
  end

  def edit
  end

 def update
 end

 private

 def item_params
   params.require(:item).permit(:image_id, :name, :introduction, :genre_id, :price, :is_active)
 end

end

