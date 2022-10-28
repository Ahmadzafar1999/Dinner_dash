# frozen_string_literal: true

# This is the product category model
class Category < ApplicationRecord
  belongs_to :product
  validates_uniqueness_of :name
  validates_length_of :name, in: 2..25
end
