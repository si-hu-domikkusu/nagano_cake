class OrdersController < ApplicationController
  def index #注文履歴画面
  end

  def show #注文履歴詳細画面
  end

  def new #注文情報入力画面
  　@order = Order.new(order_params)
  　@order.save
  end

  def confirm #注文情報確認画面
  　@order = Order.new(order_params)
  end

  def create
  end

  def complete #注文完了画面
  end

   private

  def order_params
    params.require(:order).permit(:payment_method)
  end

end
