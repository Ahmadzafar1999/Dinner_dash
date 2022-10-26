# frozen_string_literal: true

# this migration is to add a foreign key to Cart model
class AddReferenceToCart < ActiveRecord::Migration[5.2]
  def change
    add_reference :carts, :user, foreign_key: true
  end
end
