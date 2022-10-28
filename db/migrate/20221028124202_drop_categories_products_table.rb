# frozen_string_literal: true

# this migration is to drop the categories-products table
class DropCategoriesProductsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :categories_products
  end
end
