# frozen_string_literal: true

# This is the product category model
class Product < ApplicationRecord
  has_and_belongs_to_many :categories
  has_one_attached :image
  has_many :lineItems, dependent: :destroy
  validates_uniqueness_of :title
  validates :price, numericality: { greater_than: 0 }
  validates :title, :description, :price, presence: true
end
