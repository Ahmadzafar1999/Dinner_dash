# frozen_string_literal: true

# this migration is to add status enum to the orders table
class AddStatusEnumToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :status, :integer, default: 0
  end
end
