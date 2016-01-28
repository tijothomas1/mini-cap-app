class OrdersController < ApplicationController

  def create
    @order = Order.create({quantity: params[:quantity]})

    # user_id: params[:user_id],subtotal: params[:subtotal], tax: params[:tax], total: params[:total], created_at: params[:created_at], updated_at: params[:updated_at], product_id: params[:product_id]

    redirect_to '/orders/#{@order.id}'
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

end
