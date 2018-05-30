Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  post "/users" => "users#create"
  
  namespace :api do
      get '/products' => 'products#all_products'
      get '/products/:id' => 'products#show'
      post '/products' => 'products#create'
      patch '/products/:id' => 'products#update'
      delete '/products/:id' => 'products#destroy'
      post "/orders" => "orders#create"
      get "/orders/:id" => "orders#show"
  end
end
