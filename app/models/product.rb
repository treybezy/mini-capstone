class Product < ApplicationRecord

  def supplier
    Supplier.find_by(id: self.supplier_id)
    
  end

  def imagess
    Image.where(product_id: self.id)
    
  end

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
