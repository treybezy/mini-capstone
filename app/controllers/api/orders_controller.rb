class Api::OrdersController < ApplicationController
  def create
    product = Product.find(params[:product_id])

   


    @order = Order.new(
                        user_id: current_user.id,
                        products_id: params[:product_id],
                        quantity: params[:quantity],
                      )

   @order.calculate_totals

    @order.save
    render 'show.json.jbuilder'
  end
  def show
    @order = Order.find(params[:id])
    render 'show.json.jbuilder'
  end
end
