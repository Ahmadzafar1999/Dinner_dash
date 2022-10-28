# frozen_string_literal: true

# this migration is to add user id to the orders table
class AddReferenceForUserInOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :user, foreign_key: true
  end
end
