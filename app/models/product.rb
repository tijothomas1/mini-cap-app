class Product < ActiveRecord::Base

  def sale_message

    if price.to_i < 2
      "Discount item!"
    else
      "On Sale!"
    end

  end

  def tax
    p
  end


end
