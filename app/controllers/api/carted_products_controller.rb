class Api::CartedProductsController < ApplicationController
def create
  @carted_product = CartedProduct.new(
                              user_id: current_user.id,
                              product_id: params[:product_id],
                              quantity: params[:quantity],
                              status: "carted"
                              )
  @carted_product.save
  render 'show.json.jbuilder'
end
def index
  user_id = current_user.id
  @carted_product = CartedProduct.where(user_id: 2) 
  @carted_product = CartedProduct.where(status: "carted")
  render 'index.json.jbuilder'
end

end
