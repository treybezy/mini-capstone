json.id carted_product.id
  json.product do
    json.partial! carted_product.product, partial: 'api/products/product', as: :product
  end
  
end
json.quantity carted_product.quantity
json.status carted_product.status