json.name product.name
json.price product.price
json.description product.description

json.attack_bonus product.attack_bonus
json.str_bonus product.str_bonus
json.images product.images

json.imagess do
  json.array! product.images, partial: "api/images/image", as: :image
end

json.is_discounted? product.is_discounted?
json.tax product.tax
json.total product.total

json.formatted do
  json.price number_to_currency(product.price)
  json.tax number_to_currency(product.tax)
  json.total number_to_currency(product.total)
end

json.supplier do
  json.partial! product.supplier, partial: "api/suppliers/supplier", as: :supplier
end

