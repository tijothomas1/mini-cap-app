class Supplier < ActiveRecord::Base
  has_many :products  #this must be plural

end