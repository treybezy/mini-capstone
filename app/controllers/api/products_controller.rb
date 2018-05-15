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

  def destroy
    product_id = params[:id]
    @product = Product.find(product_id)
    @product.destroy
    render json: {message: "Product is destroyed"}


  end
end
