# frozen_string_literal: true

# this migration is to add foreign keys to line items table to create associations with other models
class AddForeignKeysToLineItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :line_items, :product, foreign_key: true
    add_reference :line_items, :order, foreign_key: true
    add_reference :line_items, :cart, foreign_key: true
  end
end
