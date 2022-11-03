# frozen_string_literal: true

# lineitem policy
class LineItemPolicy < ApplicationPolicy
  def index?
    user.admin? || user.customer?
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
