# frozen_string_literal: true

# This model is basically the cart of a user it has a one to one relation with User
class Cart < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
