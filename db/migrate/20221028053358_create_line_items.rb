# frozen_string_literal: true

# this migration is to create line items table
class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.decimal :subtotal

      t.timestamps
    end
  end
end
