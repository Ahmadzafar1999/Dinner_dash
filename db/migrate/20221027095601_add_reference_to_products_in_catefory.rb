# frozen_string_literal: true

# this migration is to add a foreign key to the category table for establishing a one to many relation btw entities
class AddReferenceToProductsInCatefory < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :product, foreign_key: true
  end
end
