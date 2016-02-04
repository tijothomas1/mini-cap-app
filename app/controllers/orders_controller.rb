class OrdersController < ApplicationController

  def create
    @carted_products = CartedProduct.where("status LIKE ?", "carted")
 

    @order = Order.create({subtotal: @subtotal, tax: @tax, total: @total, user_id: current_user.id})
   
    carted_products.each do |carted_product|
      carted_product.update(order_id: order.id, status: "Purchased")

    end

    order.calculate_totals

    flash[:success] = "Your order is complete"
    redirect_to "/orders/#{order.id}"


    # user_id: params[:user_id],subtotal: params[:subtotal], tax: params[:tax], total: params[:total], created_at: params[:created_at], updated_at: params[:updated_at], product_id: params[:product_id]
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

end
