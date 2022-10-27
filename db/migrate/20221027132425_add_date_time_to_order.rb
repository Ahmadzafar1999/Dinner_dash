# frozen_string_literal: true

# add timestamp to orders table
class AddDateTimeToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :time_stamp, :datetime
  end
end
