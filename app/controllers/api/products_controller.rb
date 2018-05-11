class Api::ProductsController < ApplicationController


  def all_products
    @products = Product.all
    render 'all_products.json.jbuilder'
  end

  def show
    products_id = params[:id]
    @product = Product.find(product_id)
    render 'show.json.jbuilder'
  end

  def create
    @product = Product.new(
                         name: params[:name],
                         price: params[:price],
                         description: params[:description],
                         attack_bonus: params[:attack_bonus],
                         str_bonus: params[:str_bonus]
                         )
    @product.save
    render 'index.json.jbuilder'
  end

  def update
    product_id = params[:id]
    @product = Product.find[:id]

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.attack_bonus = params[:attack_bonus] || product.directions
    @product.str_bonus = params[str_bonus] || product.prep_time

    @product.save
    render 'index.json.jbuilder'
  end

  def destroy
    product_id = params[:id]
    @product = Product.find(product_id)
    @product.destroy
    render json: {message: "Product is destroyed"}


  end
end
