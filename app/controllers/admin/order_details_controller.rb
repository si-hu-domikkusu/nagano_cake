class Admin::OrderDetailsController < ApplicationController
  def update
    @order_details = OrderDetail.find(params[:id])
    @order = @order_details.order
    @order_details.update(order_detail_params)
      if @order_details.making_status == "製作中"
        @order.update(order_status: 2)
      elsif @order.order_details.count == @order.order_details.where(making_status: "製作完了").count
        @order.update(order_status: 3)
      end
        redirect_to request.referer
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :price, :amount, :making_status)
  end

end
