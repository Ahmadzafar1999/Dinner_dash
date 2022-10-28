# frozen_string_literal: true

# This is the product category model
class Category < ApplicationRecord
  has_and_belongs_to_many :products
  validates_uniqueness_of :name
  validates_length_of :name, in: 2..25
end
