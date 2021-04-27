class OrdersController < ApplicationController
  def index #注文履歴画面
   @orders = Order.where(customer_id: current_customer.id)
  # @order = @orders.current_customer.id
  # @order_details = OrderDetail.where(order_id: @order.id)
  end

  def show #注文履歴詳細画面
   @order = Order.find(params[:id])
   @order_details = OrderDetail.where(order_id: @order.id)
  end

  def new #注文情報入力画面
    @order = Order.new
    @customer = Customer.find(current_customer.id)
    @shipping_addresses = ShippingAddress.where(customer: current_customer)
  end

  def confirm #注文情報確認画面
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = CartItem.where(customer_id: current_customer.id)
    if params[:order][:address_option].to_i == 0
      @customer = Customer.find(current_customer.id)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name

    elsif params[:order][:address_option].to_i == 1
      @ship = ShippingAddress.find(params[:order][:shipping_address_id])
      @order.postal_code = @ship.postal_code
      @order.address = @ship.address
      @order.name = @ship.name

    elsif params[:order][:address_option].to_i == 2
      @order = Order.new(order_params)
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    @cart_items = CartItem.where(customer_id: current_customer.id)

    @cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.item_id = cart_item.item.id
      @order_details.order_id = @order.id
      @order_details.amount = cart_item.amount
      @order_details.price = cart_item.item.price
      @order_details.save
    end
    @cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def complete #注文完了画面
  end

  private

  def order_params
    params.require(:order).permit(:payment_method,:postal_code,:address,:name,:shipping_cost,:total_payment,:order_status)
  end

end