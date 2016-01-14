class ProductsController < ApplicationController

  def item_display
    @products = Product.all
  end

end
