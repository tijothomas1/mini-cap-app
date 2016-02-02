class OrdersController < ApplicationController

  def create

    price = Product.find(params[:product_id]).price
    

    @order = Order.create({quantity: params[:quantity],  product_id: params[:product_id], user_id: current_user.id})
    @order.subtotal = calc_subtotal(price)
    @order.tax = calc_tax(0.09)
    @order.total = calc_total

    @order.save


    # user_id: params[:user_id],subtotal: params[:subtotal], tax: params[:tax], total: params[:total], created_at: params[:created_at], updated_at: params[:updated_at], product_id: params[:product_id]

    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

end
