class CartedProductsController < ApplicationController

  def create

    @carted_product = CartedProduct.create({user_id: current_user.id, product_id: params[:product_id], quantity: params[:quantity], status: "carted"})

    flash[:success] = "You've added a product to your cart."
    redirect_to '/cart'

  end

  def index

    if user_signed_in? && current_user.carted_products.where(status: "carted").any?
      @carted_products = current_user.carted_products.where(status: "carted")
    else
      flash[:warning] = "You should try adding products to your cart."
      redirect_to "/"
    end

    @carted_products = current_user.carted_products.where(status: "carted")
    if current_user
    @carted_products = CartedProduct.all 
    end
  end

end
