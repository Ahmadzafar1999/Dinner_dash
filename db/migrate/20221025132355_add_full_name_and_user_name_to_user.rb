# frozen_string_literal: true

# This migration is supposed to add two attributes to the table Users
class AddFullNameAndUserNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :full_name, :string
    add_column :users, :user_name, :string
  end
end
