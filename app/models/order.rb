class Order < ActiveRecord::Base
  
  has_many :carted_products
  belongs_to :user
  belongs_to :products, through: :carted_products



  def calculate_totals

    @subtotal = 0
    @tax = 0
    @total = 0

    @carted_products.each do |carted_product| 
      @subtotal += (carted_product.product.price * carted_product.quantity)
      @tax += ((carted_product.product.price * 0.09) * carted_product.quantity)
      @total += @subtotal + @tax
    end


    update(subtotal: subtotal, tax: tax, total: total)

  end

end
