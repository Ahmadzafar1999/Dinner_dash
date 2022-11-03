# frozen_string_literal: true

# these are methods to be used in the orders controller
module Orderable
  extend ActiveSupport::Concern

  def admin?
    current_user.admin?
  end

  def customer?
    current_user.customer?
  end

  def items_in_cart(val)
    LineItem.where(cart_id: val)
  end
end
