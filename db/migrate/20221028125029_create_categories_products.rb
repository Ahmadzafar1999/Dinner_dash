# frozen_string_literal: true

# this migration is to create a table relation between categories and products
class CreateCategoriesProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :categories_products, id: false do |t|
      t.belongs_to :category
      t.belongs_to :product
    end
  end
end
