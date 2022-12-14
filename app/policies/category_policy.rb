# frozen_string_literal: true

# category policy
class CategoryPolicy < ApplicationPolicy
  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
