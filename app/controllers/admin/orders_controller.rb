class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
  end

  def update
  end
  
  private

 

end
