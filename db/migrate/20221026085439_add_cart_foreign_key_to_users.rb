# frozen_string_literal: true

# this migration is to add a foreign key to User model for cart association
class AddCartForeignKeyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :cart, foreign_key: true
  end
end
