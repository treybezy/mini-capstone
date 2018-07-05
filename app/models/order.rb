class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products



def calculate_subtotal(temp_carted_products)
  temp_products = current_cart
   
   calculated_subtotal = 0
   carted_products.each do |carted_product|
  temp_subtotal += carted_product.product.price * carted_product.quantity
  end

  self.subtotal = temp_subtotal
end

def calculate_tax
  self.tax = @order.subtotal * 0.09
end

def calculate_total
  self.total = subtotal + tax
end

def purchased_on
  created_at.strftime('%b %e, %l:%M %p')
end

end


