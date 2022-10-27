# frozen_string_literal: true

# This is the product category model
class Product < ApplicationRecord
  has_many :categories
  validates_uniqueness_of :title
  validates :price, numericality: { greater_than: 0 }
  validates :title, :description, :price, presence: true
end
