class Product < ActiveRecord::Base

  belongs_to :supplier #this must be singular
  has_many :images

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
