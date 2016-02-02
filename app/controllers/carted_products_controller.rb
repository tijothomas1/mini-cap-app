class CartedProductsController < ApplicationController

  def create

    @carted_product = CartedProduct.create({user_id: current_user.id, product_id: params[:product_id], quantity: params[:quantity], status= "carted"})

  end

  def index

    @carted_products
    
  end
end
