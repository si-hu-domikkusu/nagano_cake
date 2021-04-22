class ShippingAddressesController < ApplicationController

  def index
    @shipping_address = ShippingAddress.new
    @shipping_addresses = ShippingAddress.where(customer_id: current_customer.id)
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.customer_id = current_customer.id
    if @shipping_address.save
      flash[:notice] = "You have created shipping_address successfully."
      redirect_to shipping_addresses_path
    #else
    # @items = Item.all
     #render :new
    end
  end

  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
	  @shipping_address.destroy
    @shipping_addresses = ShippingAddress.where(customer_id: current_customer.id)
    flash.now[:alert] = "配送先を削除しました"
    redirect_to shipping_addresses_path
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def update
  end

  private

  def shipping_address_params
    params.require(:shipping_address).permit(:postal_code, :address, :name)
  end
end
