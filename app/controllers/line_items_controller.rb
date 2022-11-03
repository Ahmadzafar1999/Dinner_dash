# frozen_string_literal: true

# This is the lineItems controller for manipulating and managing the data for the whole schema
class LineItemsController < ApplicationController
  before_action :set_product, only: %i[create update]
  before_action :set_line_item, only: [:destroy]
  before_action :set_order, only: [:index]

  def index
    @lineitems = LineItem.where(order_id: params[:order_id])
  end

  def create
    LineItem.create(quantity: 1, subtotal: @product.price, product_id: @product.id, cart_id: current_user.cart.id)
  end

  def update
    @lineitem = LineItem.where(cart_id: current_user.cart.id, product_id: @product.id)
    @lineitem.first.quantity += 1 if params[:counter] == '1'
    @lineitem.first.quantity -= 1 if params[:counter] == '0'
    @lineitem.first.subtotal =  @lineitem.first.product.price * @lineitem.first.quantity
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

  def set_order
    @order = Order.find_by(id: params[:order_id])
  end
end
