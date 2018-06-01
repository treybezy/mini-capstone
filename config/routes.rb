Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  post "/users" => "users#create"
  
  namespace :api do
      get '/products' => 'products#index'
      get '/products/:id' => 'products#show'
      post '/products' => 'products#create'
      patch '/products/:id' => 'products#update'
      delete '/products/:id' => 'products#destroy'
      
      post "/orders" => "orders#create"
      get "/orders/:id" => "orders#show"

      post '/carted_products' => 'carted_products#create'
      # get '/carted_products' => 'carted_products#index'
  end
end
