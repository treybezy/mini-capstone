json.array! @products.each do |product|
json.name product.name
json.price product.price
json.description product.description
json.image_url product.image_url
json.attack_bonus product.attack_bonus
json.str_bonus product.str_bonus
json.imagess product.imagess

json.is_discounted? product.is_discounted
json.tax product.tax
json.total product.total
json.supplier product.supplier
json.formatted do
  json.price number_to_currency(product.price)
  json.tax number_to_curreny(product.tax)
  json.total number_to_currency(product.total)

end
json.supplier do
  json.partial! product.supplier, partial: "api/suppliers/supplier", as: :supplier
end

json.images do
  json.array! product.images, partial: "api/images/image", as: :image
end