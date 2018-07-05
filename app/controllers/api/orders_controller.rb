class Api::OrdersController < ApplicationController
before_action :authenticate_user

  def index
    @carted_products = current_user.current_cart
  end
  def create
    carted_products = current_cart
   
  @order = Order.new(user_id: current_user.id)
  @order.save
  current_user.current_cart.update_all(status: "purchased", order_id: @order.id)

  @order.calculate_subtotal(carted_products)
  @order.calculate_tax
  @order.calculate_total

  
  @order.save


  
  render 'show.json.jbuilder'
  end

    
    
  end
  def show
    @order = Order.find(params[:id])
    render 'show.json.jbuilder'
  end
end
