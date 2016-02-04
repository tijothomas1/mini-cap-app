class CartedProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :user
  belongs_to :product


  def subtotal
    product.price * quantity
  end

end
