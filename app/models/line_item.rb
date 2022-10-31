# frozen_string_literal: true

# This is the line item model, a record of this model will contain all the information together
class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart, optional: true
  belongs_to :order, optional: true
  validates :subtotal, :quantity, :product_id, presence: true
  validates :subtotal, :quantity, numericality: { greater_than_or_equal_to: 0 }
end
