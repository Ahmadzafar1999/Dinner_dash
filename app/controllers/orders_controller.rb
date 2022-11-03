# frozen_string_literal: true

# This is the orders controller to manage and manipulate the orders
class OrdersController < ApplicationController
  include Orderable
  before_action :set_order, only: %i[update show]
  before_action :order_params, only: [:create]

  def index
    if admin?
      @orders = Order.all
    elsif customer?
      @orders = Order.where(user_id: current_user.id)
    end
  end

  def create
    @order = Order.create!(order_params)
    shift_items_to_order
  end

  def show; end

  def update
    case params[:recieved]
    when '0'
      @order.status = 2
    when '1'
      @order.status = 3
    end
    @order.time_stamp = DateTime.now
    @order.save
    redirect_to line_items_path(order_id: @order.id)
  end

  private

  def order_params
    params.require(:order).permit!
  end

  def shift_items_to_order
    set_cart
    @lineitems = items_in_cart(@cart.id)
    @lineitems.each do |lineitem|
      lineitem.order_id = @order.id
      lineitem.cart_id = nil
      lineitem.save
    end
    redirect_to line_items_path(order_id: @order.id)
  end

  def set_cart
    @cart = Cart.find_by(id: current_user.cart.id)
  end

  def set_order
    @order = Order.find_by(id: params[:id])
  end
end
