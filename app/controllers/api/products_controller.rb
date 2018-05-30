class Api::ProductsController < ApplicationController
  before_action :authenticate_user

  # def index
  #   # if current_user
  #   @products = Product.all
  #   search_term = params[:search]
  #   if search_term
  #     @products = @products.where("name iLIKE ?", "%#{search_term}%")
  #   end
  #     i_should_sort_by = params[:sort_by]
  #     if i_should_sort_by == "price"
  #       @products = @products.order(:price => :asc)
  #     else

  #     @products = @products.order(:id => :asc)
  #   end

  #     sort_attribute = params[:sort_by]
  #     sort_order = params[:sort_order]

  #     if sort_attribute
  #       @products = @products.order(sort_attribute => :asc)
  #     elsif sort_attribute && sort_order
  #       @products = @products.order(sort_attribute => sort_order)
  #     else
  #       @products = @products.order(:id=> :asc)
  #     end


  #     render 'index.json.jbuilder'
  #     #  else
  #     # render json: []
  #   end
  #  end

   def index
    @products = Product.all

    search_term = params[:search]
    if search_term
      @products = @products.where("name iLIKE ? OR description iLIKE ?", "%#{search_term}%", "%#{search_term}%")
    end

    sort_attribute = params[:sort_by]
    sort_order = params[:sort_order]

    if sort_attribute && sort_order
      @products = @products.order(sort_attribute => sort_order)
    elsif sort_attribute
      @products = @products.order(sort_attribute => :asc)
    else
      @products = @products.order(:id => :asc)
    end

    render 'index.json.jbuilder'
  end

  # def all_products
  #   @products = Product.all
  #   render 'all_products.json.jbuilder'
  # end

  def show
    product_id = params[:id]
    @product = Product.find(product_id)
    render 'show.json.jbuilder'
  end

  def create
    @product = Product.new(
                         name: params[:name],
                         price: params[:price],
                         description: params[:description],
                         attack_bonus: params[:attack_bonus],
                         str_bonus: params[:str_bonus],
                         supplier_id: params[:supplier_id]
                         )
    @product.save
    render 'index.json.jbuilder'
  end

  def update
    product_id = params[:id]
    @product = Product.find(product_id)

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    
    @product.description = params[:description] || @product.description
    @product.attack_bonus = params[:attack_bonus] || @product.attack_bonus
    @product.str_bonus = params[:str_bonus] || @product.str_bonus
    @product.supplier_id = params[:supplier_id] || @product.supplier_id
    
    @product.save
    render 'show.json.jbuilder'
  end

  def destroy
    product_id = params[:id]
    @product = Product.find(product_id)
    @product.destroy
    render json: {message: "Product is destroyed"}


  end


  
end
