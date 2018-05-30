class Product < ApplicationRecord

belongs_to :supplier
  # def supplier
  #   Supplier.find_by(id: self.supplier_id)
    
  # end
has_many :images
has_many :orders
  # def imagess
  #   Image.where(product_id: self.id)
    
  # end
  has_many :product_categories

  def is_discounted?
    if price < 10
  end
end


  def tax
    price  * 0.09
    
  end

  def total
     price + tax

  end



end
