class OrdersController < ApplicationController

  def create
    @carted_products = CartedProduct.where("status LIKE ?", "carted")

    @subtotal = 0
    @tax = 0
    @total = 0

    @carted_products.each do |carted_product| 
      @subtotal += (carted_product.product.price * carted_product.quantity)
      @tax += ((carted_product.product.price * 0.09) * carted_product.quantity)
      @total += @subtotal + @tax
    end

    

    @order = Order.create({subtotal: @subtotal, tax: @tax, total: @total, user_id: current_user.id})
   

    @carted_products.each do |carted_product|
      # carted_product.update(order_id: order.id, status: "Purchased") similar to lines 23 and 24
      carted_product.order_id = @order.id 
      carted_product.status = "Purchased"

      carted_product.save

    end

    # user_id: params[:user_id],subtotal: params[:subtotal], tax: params[:tax], total: params[:total], created_at: params[:created_at], updated_at: params[:updated_at], product_id: params[:product_id]

    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

end
