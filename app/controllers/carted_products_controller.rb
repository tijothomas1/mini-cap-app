class CartedProductsController < ApplicationController

  def create

    @carted_product = CartedProduct.create({user_id: current_user.id, product_id: params[:product_id], quantity: params[:quantity], status: "carted"})

     redirect_to '/cart'

  end

  def index
    if current_user
    @carted_products = CartedProduct.all 
    end
  end

end
