# frozen_string_literal: true

# these are methods to be used in the cart controller
module Cartable
  extend ActiveSupport::Concern

  def items_in_user_cart
    LineItem.where(cart_id: current_user.cart.id)
  end
end
