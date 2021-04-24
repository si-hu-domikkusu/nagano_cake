class OrdersController < ApplicationController
  def index #注文履歴画面
  end

  def show #注文履歴詳細画面
  end

  def new #注文情報入力画面
    @order = Order.new
    @customer = Customer.find(current_customer.id)
    @shipping_addresses = ShippingAddress.where(customer: current_customer)
  end

  def confirm #注文情報確認画面

  end

  def create
  end

  def complete #注文完了画面
  end
end