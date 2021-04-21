class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if  @customer.update(customer_params)
        flash[:notice] = "You have updated  successfully."
        redirect_to customer_path(@customer)
    else
        render :edit
    end
  end

  def quit
    # @customer = Customer.find(params[:id])
  end

  def withdraw
    # @customer = Customer.find(params[:id])
    # @customer.update(is_deleted: true)
    # reset_session
    # flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    # redirect_to root_path
  end

  private

	def customer_params
	  params.require(:customer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :email, :postal_code, :address, :phone_number, :is_deleted)
  end

end
