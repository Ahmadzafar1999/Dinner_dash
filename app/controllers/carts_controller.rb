# frozen_string_literal: true

# This is the product category controller
class CartsController < ApplicationController
  before_action :set_cart, only: %i[show edit update destroy]
  before_action :set_product, only: [:update]

  def index
    @carts = Cart.all
  end

  def show
    @lineitems = LineItem.where(cart_id: current_user.cart.id)
  end

  def new
    @cart = Cart.new
  end

  def edit; end

  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to cart_url(@cart), notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @lineitem = if LineItem.find_by(cart_id: current_user.cart.id, product_id: params[:product_id])
                  LineItem.where(cart_id: current_user.cart.id, product_id: params[:product_id])
                else
                  LineItem.create(quantity: 0, subtotal: 0, product_id: params[:product_id],
                                  cart_id: current_user.cart.id)
                end
    @lineitem.first.quantity += 1 if params[:counter] == '1'
    @lineitem.first.quantity -= 1 if params[:counter] == '0'
    @lineitem.first.subtotal =  @product.price * @lineitem.first.quantity
    @lineitem.first.save
    redirect_to products_path
  end

  def destroy
    @cart.destroy

    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params.require(:cart).permit(:user_id)
  end

  def set_product
    @product = Product.find_by(id: params[:product_id])
  end
end
