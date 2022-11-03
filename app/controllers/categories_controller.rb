# frozen_string_literal: true

# This is the product category controller
class CategoriesController < ApplicationController
  before_action :set_category, only: %i[destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to products_path
    else
      redirect_to new_category_path
    end
  end

  def destroy
    @category.destroy
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
