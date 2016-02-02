class Product < ActiveRecord::Base

  belongs_to :supplier #this must be singular
  has_many :images
  has_many :orders
  has_many :user, through: :carted_product

  def sale_message

    if price.to_i < 2
      "Discount item!"
    else
      "On Sale!"
    end

  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  def get_the_first_image
    if images.first
      fimages.first.url
    else

    end
    
  end


end
