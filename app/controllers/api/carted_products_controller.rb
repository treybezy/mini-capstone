class Api::CartedProductsController < ApplicationController

  def index
  @carted_product = CartedProduct.where(user_id: current_user.id, status: "carted") 
  render 'index.json.jbuilder'
end
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
def destroy
  carted_product_id = params[:id]
  carted_product = CartedProduct.find(cared_product_id)
  carted_product.update(status: "removed")
  render json: {message: "Removed Item from Cart"}
end

end
