# frozen_string_literal: true

# this migration is to remove a status column from orders table
class RemoveColumnStatusFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :status
  end
end
