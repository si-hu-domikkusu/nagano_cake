class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end

  def quit
  end

  def withdraw
  end

  private

	def customer_params
	  params.require(:customer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :email, :postal_code, :address, :phone_number, :is_deleted)
  end

end
