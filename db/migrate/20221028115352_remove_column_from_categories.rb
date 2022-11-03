# frozen_string_literal: true

# this migration is to remove product foreign key from categories
class RemoveColumnFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :product_id
  end
end
