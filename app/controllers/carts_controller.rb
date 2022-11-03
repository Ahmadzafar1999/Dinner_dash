# frozen_string_literal: true

# This is the product category controller
class CartsController < ApplicationController
  before_action :set_cart, only: [:show]

  def show
    @lineitems = LineItem.where(cart_id: current_user.cart.id)
  end

  def create
    @cart = Cart.new(cart_params)
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params.require(:cart).permit(:user_id)
  end
end
