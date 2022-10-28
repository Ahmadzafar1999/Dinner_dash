# frozen_string_literal: true

# this migration is to create a categories model for product categorization
class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
