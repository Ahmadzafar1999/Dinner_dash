# frozen_string_literal: true

# these are methods to be used in the lineItem controller
module Lineitemable
  extend ActiveSupport::Concern

  def line_items_in_order(id_val)
    LineItem.where(order_id: id_val)
  end

  def line_item_to_update(id_val, count)
    @lineitem = LineItem.where(cart_id: current_user.cart.id, product_id: id_val)
    @lineitem.first.quantity += 1 if count == '1'
    @lineitem.first.quantity -= 1 if count == '0'
    @lineitem.first.subtotal =  @lineitem.first.product.price * @lineitem.first.quantity
    @lineitem
  end
end
