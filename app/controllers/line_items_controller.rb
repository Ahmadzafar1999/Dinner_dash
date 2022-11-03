# frozen_string_literal: true

# This is the lineItems controller for manipulating and managing the data for the whole schema
class LineItemsController < ApplicationController
  include Lineitemable
  before_action :set_product, only: %i[create update]
  before_action :set_line_item, only: [:destroy]

  def index
    @lineitems = line_items_in_order(params[:order_id])
    @order = Order.find_by(id: params[:order_id])
  end

  def create
    LineItem.create(quantity: 1, subtotal: @product.price, product_id: @product.id, cart_id: current_user.cart.id)
  end

  def update
    @lineitem = line_item_to_update(@product.id, params[:counter])
    @lineitem.first.save
    redirect_to cart_path(current_user.cart.id)
  end

  def destroy
    @lineitem.destroy
    redirect_to cart_path(current_user.cart.id)
  end

  private

  def set_line_item
    @lineitem = LineItem.find_by(id: params[:id])
  end

  def set_product
    @product = Product.find_by(id: params[:product_id])
  end
end
