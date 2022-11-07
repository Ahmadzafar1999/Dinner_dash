# frozen_string_literal: true

# This is the products controller to deal with all the logial aspects of products
class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
    if params[:category_ids].present?
      ids = params[:category_ids].filter { |el| el != '' }
      if ids.present?
        ids.each do |cat|
          @products = Category.find_by(id: cat.to_i).products
        end
      end
    end
    @products
  end

  def show; end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)
    assign_categories
    if @product.save
      redirect_to product_path(@product)
    else
      redirect_to new_product_path
    end
  end

  def update
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find_by(id: params[:id])
  end

  def assign_categories
    ids = params[:product][:category_ids].filter { |el| el != '' }
    @product.categories << Category.where(id: ids.map(&:to_i))
  end

  def product_params
    params.require(:product).permit(:title, :description, :price)
  end
end
