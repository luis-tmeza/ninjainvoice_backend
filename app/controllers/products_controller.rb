class ProductsController < ApplicationController
  def index
    @products = Product.all
    render json: @products
  end

  def show
    @product = Product.find(params[:id])
    render json: @product
  end

  def create
    @product = Product.create(
      name: params[:name],
      price: params[:price],
      stock: params[:stock]
    )
    render json: @product
  end


  def update
    @product = Product.find(params[:id])
    @product.update(
      name: params[:name],
      price: params[:price],
      stock: params[:stock]

    )
    render json: @product
  end

  def destroy
    @products = Product.all
    @product = Product.find(params[:id])
    @product.destroy
    render json: @products
  end
end
