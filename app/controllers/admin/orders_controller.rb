class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).per(10)
    #@order_details = OrderDetail.where(order_id: @order.id)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.update(order_params)
    if @order.order_status == "入金確認"
      @order_details.update(making_status: 1)
    end
      redirect_to request.referer
  end

  private

  def order_params
    params.require(:order).permit(:payment_method,:postal_code,:address,:name,:shipping_cost,:total_payment,:order_status)
  end


end
