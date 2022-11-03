# frozen_string_literal: true

# This is the product category controller
class CartsController < ApplicationController
  include Cartable
  before_action :set_cart, only: [:show]

  def show
    @lineitems = items_in_user_cart
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params.require(:cart).permit(:user_id)
  end
end
