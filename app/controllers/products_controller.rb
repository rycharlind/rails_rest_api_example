class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :update, :destroy]
    before_action :set_user, only: [:index, :create, :show]
  
    def index
      @products = @user.products
      if @products
        render json: @products
      else
        render json: { error: 'Products not found' }, status: :not_found
      end
    end
  
    def show
      @product = @user.products.find_by(id: params[:id])
      if @product
        render json: @product
      else
        render json: { error: 'Product not found or does not belong to the user' }, status: :not_found
      end
    end
  
    def create
      @product = @user.products.new(product_params)
      if @product.save
        render json: @product, status: :created
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @product.update(product_params)
        render json: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @product.destroy
      head :no_content
    end
  
    private
  
    def set_product
      @product = Product.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end
  
    def product_params
      params.require(:product).permit(:title, :description, :price, :user_id)
    end
  end
  