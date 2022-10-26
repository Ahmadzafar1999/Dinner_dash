# frozen_string_literal: true

# This is the homepage and index is the root path of this application
class HomePolicy < ApplicationPolicy
  def index
    user.admin? || user.customer?
  end
end
