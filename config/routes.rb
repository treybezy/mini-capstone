Rails.application.routes.draw do
  namespace :api do
      get '/display_all_products' => 'products#all_products'
      get '/display_first_product' => 'products#first_product'
      
  end
end
