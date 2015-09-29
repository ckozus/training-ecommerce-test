class PaymentsController < ApplicationController
  before_action :load_products

  def checkout
    @order = Order.new
  end

  def process_payment
    @order = Order.new(order_params)
    if @order.save
      mpp = MercadoPagoPayment.new
      payments = mpp.build(@order, @products_in_cart)
      redirect_to payments['sandbox_init_point']
    else
      render :checkout
    end
  end

  def success
    @order = Order.find(params[:external_reference])
    @order.update_attributes(status: 'success')
    session[:cart] = []
  end

protected

  def order_params
    params.require(:order).permit(:name, :surname, :email)
  end

end
