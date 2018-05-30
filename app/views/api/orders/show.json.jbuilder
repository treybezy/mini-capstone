json.id @order.id

json.user do
  json.id @order.user_id
  json.email @order.user.email
end

json.product do
  json.partial! @order.product, partial: 'api/products/product', as: :product  
end

json.quantity @order.quantity
json.subtotal @order.subtotal
json.tax @order.tax
json.total @order.total

json.formatted do
  json.subtotal number_to_currency(@order.subtotal)
  json.tax number_to_currency(@order.subtotal)
  json.total number_to_currency(@order.subtotal)
end