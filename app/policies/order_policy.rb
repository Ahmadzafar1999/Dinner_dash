# frozen_string_literal: true

# order policy
class OrderPolicy < ApplicationPolicy
  def index?
    user.admin? || user.customer?
  end

  def create?
    user.customer?
  end

  def show?
    user.customer?
  end

  def update?
    user.admin?
  end
end
