class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :update, :destroy]


  def index
    # if current_user
    @products = Product.all
    search_term = params[:search]
    if search_term
      @products = @products.where("name iLIKE ?", "%#{search_term}%")
    end
      i_should_sort_by = params[:sort_by]
      if i_should_sort_by == "price"
        @products = @products.order(:price => :asc)
      else

        @products = @products.order(:id => :asc)
      end

      sort_attribute = params[:sort_by]
      sort_order = params[:sort_order]

      if sort_attribute
        @products = @products.order(sort_attribute => :asc)
      elsif sort_attribute && sort_order
        @products = @products.order(sort_attribute => sort_order)
      else
        @products = @products.order(:id=> :asc)
      end

      category_name = params[:category]
      if category_name
        category = Category.find_by(name: category_name)
        @products = category.products
      end

      render 'index.json.jbuilder'
      #  else
      # render json: []
    # end
   end


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
    if @product.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end

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
    
   if @product.save
    render 'show.json.jbuilder'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    
    product_id = params[:id]
    @product = Product.find(product_id)
    @product.destroy
    render json: {message: "Product is destroyed"}
 

  end


  
end

