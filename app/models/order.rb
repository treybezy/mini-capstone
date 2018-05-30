class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user


def calculate_subtotal
self.subtotal = product.price * quantity
end


def calculate_tax
self.tax = subtotal * 0.9
end

def calculate_total
  self.total = subtotal + tax
end

def calculate_totals
  calculate_subtotal
  calculate_tax
  calculate_total

end
